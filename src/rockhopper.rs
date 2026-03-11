//! CLI rockhopper tool

extern crate getopts;
extern crate regex;
extern crate rockhopper;

use die::{Die, die};

use std::collections::BTreeMap;
use std::env;

/// CLI entrypoint
fn main() {
    let brief: String = format!(
        "Usage: {} [<OPTIONS>] [-- <ROCKLET_OPTIONS>]",
        env!("CARGO_PKG_NAME")
    );

    let rocklet_env_pattern = regex::Regex::new("^(?P<key>.+)=(?P<value>.*)$").unwrap();

    let mut opts: getopts::Options = getopts::Options::new();
    opts.optflag("c", "clean", "remove artifacts");
    opts.optflag("d", "debug", "enable additional logging");
    opts.optflag("q", "quiet", "reduce logging");
    opts.optmulti(
        "r",
        "rocklet-env",
        "set global rocklet option",
        "<key>=<value>",
    );
    opts.optflag("h", "help", "show usage menu");
    opts.optflag("v", "version", "show version banner");

    let usage: String = opts.usage(&brief);
    let arguments: Vec<String> = env::args().collect();
    let optmatches: getopts::Matches = opts.parse(&arguments[1..]).die(&usage);

    if !optmatches.free.is_empty() {
        die!(usage);
    }

    if optmatches.opt_present("h") {
        die!(0; usage);
    }

    if optmatches.opt_present("v") {
        die!(0; format!("{} {}", env!("CARGO_PKG_NAME"), env!("CARGO_PKG_VERSION")));
    }

    let mut rh = match rockhopper::Rockhopper::load(rockhopper::CONFIGURATION_FILENAME) {
        Err(e) => die!(1; format!("error: {e}")),
        Ok(e) => e,
    };

    if optmatches.opt_present("q") {
        rh.log_level = Some(rockhopper::LogLevel::Quiet);
    }

    if optmatches.opt_present("d") {
        rh.log_level = Some(rockhopper::LogLevel::Debug);
    }

    for entry in optmatches.opt_strs("r") {
        let (key, value) = rocklet_env_pattern
            .captures(&entry)
            .map(|e| (e["key"].to_string(), e["value"].to_string()))
            .die(&format!("invalid env entry: {entry}"));
        rh.rocklet
            .as_mut()
            .unwrap_or(&mut BTreeMap::new())
            .insert(key, value);
    }

    rh.rocklet_args = optmatches.free.clone();

    if let Some(rockhopper::LogLevel::Debug) = rh.log_level {
        eprintln!("debug: configuration: {:?}", rh);
    }

    if optmatches.opt_present("c") {
        if let Err(e) = rh.clean() {
            die!(1; format!("error: {e}"));
        } else {
            die!(0);
        }
    }

    if let Err(e) = rh.build() {
        die!(1; format!("error: {e}"));
    }
}
