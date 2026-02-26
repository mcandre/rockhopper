//! rockhopper provides predicates for generating software packages.

extern crate fs_extra;
extern crate toml;

use serde::{Deserialize, Serialize};

use std::collections::BTreeMap;
use std::fmt;
use std::fs;
use std::path;
use std::process;

/// CONFIGURATION_FILENAME denotes the file path to an optional TOML configuration file,
/// relative to the current working directory.
pub static CONFIGURATION_FILENAME: &str = "rockhopper.toml";

/// DEFAULT_CACHE denotes the default directory root for rockhopper managed data.
pub static DEFAULT_CACHE: &str = ".rockhopper";

/// DATA denotes the directory root for source media files, relative to rocklet cache.
pub static DATA: &str = "source-media";

/// DEFAULT_DOCKER_MOUNT_PATH denotes the default location of the Docker mount directory,
/// where the current working directory gets loaded into containers.
pub static DEFAULT_DOCKER_MOUNT_PATH: &str = "/mnt/rockhopper";

#[derive(Debug)]
pub enum RockhopperError {
    IOError(String),
    TOMLParseError(String),
}

impl fmt::Display for RockhopperError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            RockhopperError::IOError(e) => write!(f, "{e}"),
            RockhopperError::TOMLParseError(e) => write!(f, "{e}"),
        }
    }
}

impl die::PrintExit for RockhopperError {
    fn print_exit(&self) -> ! {
        eprintln!("{}", self);
        process::exit(die::DEFAULT_EXIT_CODE);
    }
}

/// LogLevel modules log noise.
#[derive(Clone, Debug, Default, Deserialize, PartialEq, Serialize)]
#[serde(rename_all = "snake_case")]
pub enum LogLevel {
    /// Info propagates child process stdout/stderr.
    #[default]
    Info,

    /// Quiet elides most logs, especially non-error logs.
    Quiet,

    /// Debug enables additional logs.
    Debug,
}

impl fmt::Display for LogLevel {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(
            f,
            "{}",
            match self {
                LogLevel::Info => "info",
                LogLevel::Quiet => "quiet",
                LogLevel::Debug => "debug",
            },
        )
    }
}

/// Dest maps destination file paths to source media file paths.
pub type Dest = BTreeMap<String, String>;

/// Pkg generates install media.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Pkg {
    /// image denotes a Docker image.
    pub image: String,

    /// rocklet overrides global rocklet entries.
    pub rocklet: Option<BTreeMap<String, String>>,

    /// dest overrides global dest entries.
    pub dest: Option<Dest>,
}

/// Rockhopper builds software packages.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Rockhopper {
    /// log_level modulates log noise (optional).
    pub log_level: Option<LogLevel>,

    /// rocklet supplies additional build configuration to rocklets (requirements vary by distro).
    pub rocklet: Option<BTreeMap<String, String>>,

    /// dest maps destination file paths to source file paths.
    pub dest: Option<Dest>,

    /// docker_env supplies custom environment variables to rocklets.
    pub docker_env: Option<BTreeMap<String, String>>,

    /// docker_args supplies additional CLI arguments to `docker run`... commands (optional).
    pub docker_args: Option<Vec<String>>,

    /// pkg collects the packages to be built.
    pub pkg: Option<Vec<Pkg>>,

    /// rocklet_args supplies additional CLI arguments to rocklets (optional).
    #[serde(skip)]
    pub rocklet_args: Vec<String>,
}

impl Rockhopper {
    /// load generates a Rockhopper.
    pub fn load(pth: &str) -> Result<Self, RockhopperError> {
        let toml_string = fs::read_to_string(pth)
            .map_err(|_| RockhopperError::IOError(format!("unable to read file: {pth}")))?;
        let rh: Rockhopper = toml::from_str(&toml_string)
            .map_err(|e| RockhopperError::TOMLParseError(e.message().to_string()))?;
        Ok(rh)
    }

    /// build_package generates install media.
    pub fn build_package(&self, pkg: &Pkg) -> Result<(), RockhopperError> {
        let log_level: LogLevel = self.log_level.clone().unwrap_or_default();
        let rocklet = self.rocklet.clone().unwrap_or_default();
        let default_cache = DEFAULT_CACHE.to_string();
        let cache = path::Path::new(rocklet.get("cache").unwrap_or(&default_cache));
        let dest: BTreeMap<String, String> = self
            .dest
            .clone()
            .unwrap_or_default()
            .into_iter()
            .chain(pkg.dest.clone().unwrap_or_default())
            .collect();

        if !dest.is_empty() {
            let source_media = cache.join(DATA);

            if source_media.exists() {
                if log_level == LogLevel::Debug {
                    eprintln!("debug: cleaning {:?}", source_media);
                }

                fs::remove_dir_all(&source_media)
                    .map_err(|e| RockhopperError::IOError(e.to_string()))?;
            }

            fs::create_dir_all(&source_media)
                .map_err(|e| RockhopperError::IOError(e.to_string()))?;

            for (k, v) in dest {
                let source_media_k = source_media.join(k);
                let metadata =
                    fs::metadata(&v).map_err(|e| RockhopperError::IOError(e.to_string()))?;

                if metadata.is_dir() {
                    let mut options = fs_extra::dir::CopyOptions::new();
                    options.content_only = true;
                    fs::create_dir_all(&source_media_k)
                        .map_err(|e| RockhopperError::IOError(e.to_string()))?;
                    fs_extra::dir::copy(v, source_media_k, &options)
                        .map_err(|e| RockhopperError::IOError(e.to_string()))?;
                } else if metadata.is_file() {
                    let source_media_p =
                        source_media_k
                            .parent()
                            .ok_or(RockhopperError::IOError(format!(
                                "unable to retrieve parent directory for path: {:?}",
                                &source_media_k
                            )))?;

                    fs::create_dir_all(source_media_p)
                        .map_err(|e| RockhopperError::IOError(e.to_string()))?;
                    fs::copy(v, source_media_k)
                        .map_err(|e| RockhopperError::IOError(e.to_string()))?;
                } else {
                    return Err(RockhopperError::IOError(format!(
                        "unsupported file system file type for path: {v}"
                    )));
                }
            }
        }

        let mut cmd = process::Command::new("docker");
        let mut args: Vec<String> = vec!["run".to_string()];
        let oci_arch = match &pkg.rocklet {
            Some(e) => e.get("oci_arch"),
            _ => None,
        };

        if let Some(platform) = &oci_arch {
            args.extend(["--platform".to_string(), platform.to_string()]);
        }

        if let Some(docker_args) = self.docker_args.clone() {
            args.extend(docker_args);
        }

        let default_docker_mount_path = &DEFAULT_DOCKER_MOUNT_PATH.to_string();
        let mount_path = rocklet
            .get("mount_path")
            .unwrap_or(default_docker_mount_path);
        args.extend(["-v".to_string(), format!(".:{mount_path}")]);
        args.extend(["-e".to_string(), format!("rocklet_log_level={log_level}")]);

        for (k, v) in rocklet {
            args.extend(["-e".to_string(), format!("rocklet_{k}={v}")]);
        }

        for (k, v) in self.docker_env.clone().unwrap_or_default() {
            args.extend(["-e".to_string(), format!("{k}={v}")]);
        }

        for (k, v) in pkg.rocklet.clone().unwrap_or_default() {
            args.extend(["-e".to_string(), format!("rocklet_{k}={v}")]);
        }

        let image = &pkg.image;

        if image.is_empty() {
            return Err(RockhopperError::IOError("missing/blank image".to_string()));
        }

        args.push(image.to_string());
        args.extend(self.rocklet_args.clone());
        cmd.args(args);
        cmd.stderr(process::Stdio::inherit());
        cmd.stdout(process::Stdio::inherit());

        let mut target = String::new();
        target.push_str(image);

        if let Some(platform) = oci_arch {
            target.push_str(&format!(" platform={platform}"));
        }

        if let Some(arch) = pkg.rocklet.clone().unwrap_or_default().get("os_arch") {
            target.push_str(&format!(" os_arch={arch}"));
        }

        println!("building {target}");

        if log_level == LogLevel::Debug {
            eprintln!("debug: running command: {:?}", cmd);
        }

        let status = cmd
            .status()
            .map_err(|e| RockhopperError::IOError(e.to_string()))?;

        if !status.success() {
            return Err(RockhopperError::IOError(
                "unable to build package".to_string(),
            ));
        }

        Ok(())
    }

    /// build generates packages.
    pub fn build(&self) -> Result<(), RockhopperError> {
        let rocklet = self.rocklet.clone().unwrap_or_default();
        let default_cache = DEFAULT_CACHE.to_string();
        let cache = path::Path::new(rocklet.get("cache").unwrap_or(&default_cache));
        let pkg = self.pkg.clone().unwrap_or_default();

        if pkg.is_empty() {
            eprintln!("warning: missing/empty pkg array");
        } else {
            for p in pkg {
                self.build_package(&p)?;
            }

            let artifacts = cache.join("artifacts");
            println!("packages written to {:?}", artifacts);
        }

        Ok(())
    }

    /// clean removes artifacts.
    pub fn clean(&self) -> Result<(), RockhopperError> {
        let rocklet = self.rocklet.clone().unwrap_or_default();
        let default_cache_dir = DEFAULT_CACHE.to_string();
        let cache_dir = rocklet.get("cache").unwrap_or(&default_cache_dir);

        if path::Path::new(cache_dir).exists() {
            return fs::remove_dir_all(cache_dir)
                .map_err(|e| RockhopperError::IOError(e.to_string()));
        }

        Ok(())
    }
}
