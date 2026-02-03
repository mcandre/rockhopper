# rockhopper: Linux package generator

[![Docker Pulls](https://img.shields.io/docker/pulls/n4jm4/rockhopper)](https://hub.docker.com/r/n4jm4/rockhopper) [![license](https://img.shields.io/badge/license-BSD-0)](LICENSE.md) [![Donate](https://img.shields.io/badge/GUMROAD-36a9ae?style=flat&logo=gumroad&logoColor=white)](https://mcandre.gumroad.com/)

```text
  o<  gak! gak!
-/)
 ^^
```

# SUMMARY

rockhopper automates *crossplatform package generation*.

Distro hoppers, enjoy~

# DEMO

```console
$ cd examples/sh

$ ./demo

$ tree .rockhopper
.rockhopper
├── alpine
│   └── hello-1.0.0-r1.noarch.apk
├── arch
│   └── hello-1.0.0-1-any.pkg.tar.zst
├── debian
│   └── hello_1.0.0-1_all.deb
├── rhel
│   └── hello-1.0.0-1.fc43.noarch.rpm
└── slack
    └── hello-1.0.0-1-noarch-build.tgz
```

# INSTALLATION

See [INSTALL.md](INSTALL.md).

# ABOUT

rockhopper works by managing a collection of Docker images.

Base image name: `n4jm4/rockhopper`

The base image name combines with tags to form specific images.

Example: `n4jm4/rockhopper:debian`

Each image can potentially build packages for an entire family of operating systems.

## Packages

| Tag      | Glob            | Managers         | Family                                                            |
| -------- | --------------- | ---------------- | ----------------------------------------------------------------- |
| `alpine` | `*.apk`         | apk              | [Alpine Linux](https://distrowatch.com/search.php?basedon=Alpine) |
| `arch`   | `*.pkg.tar.zst` | pacman           | [Arch Linux](https://distrowatch.com/search.php?basedon=Arch)     |
| `debian` | `*.deb`         | apt, dpkg        | [Debian](https://distrowatch.com/search.php?basedon=Debian)       |
| `rhel`   | `*.rpm`         | dnf, rpm, zypper | [Fedora](https://distrowatch.com/search.php?basedon=Fedora)       |
| `slack`  | `*-build.tgz`   | installpkg       | [Slackware](https://distrowatch.com/search.php?basedon=Slackware) |

# USAGE

rockhopper transforms application assets into installer packages. Here's how to do it!

1. Build Linux executables for your application.

```text
no pain, no gain!  >*
                   (\-
                   ^^
```

Examples:

* [crit](https://github.com/mcandre/crit) (Rust)
* [factorio](https://github.com/mcandre/factorio) (Go)
* [snek](https://github.com/mcandre/snek) (C/C++)
* JAR's wrapped in shell scripts (JVM)
* chmod +x (shell scripts)

Pro tip: Target the standard library moreso than third party libraries. Dependency optimization dovetails nicely with portability. Double points for targeting portable build system configurations.

2. Inside your project, create a `rockhopper-data` subdirectory. Within `rockhopper-data`, layout all of your application's assets as they should appear on the end user's machine after installation.

Linux, UNIX, and many other operating systems follow the [Filesystem Hierarchy Standard](https://specifications.freedesktop.org/fhs/latest/).

Example:

```console
$ tree
.
└── rockhopper-data
    └── usr
        └── bin
            └── hello
```

Remember to apply the desired uid's, gid's, and chmod permissions to your entries.

3. Spawn a container. Tailor the flags to suit your packaging needs.

Example:

```sh
docker run --rm \
    -v "$(pwd):/src" \
    n4jm4/rockhopper:debian \
    --name hello \
    --version 1.0.0 \
    --arch all \
    --maintainer "Bob <bob@bobsautoparts.test>" \
    --description "greeter" \
    --license 0BSD \
    --release 1
```

Most applications need other packages in order to work. Optionally, insert a `--dependencies <dependencies>` flag in there. Consult your target operating systems' documentation to identify the relevant package names and versions.

rockhopper forwards the configuration to the target OS build commands for package generation.

Example:

```console
% tree .rockhopper
.rockhopper
└── debian
    └── hello_1.0.0-1_all.deb
```

Packages write to `.rockhopper/<os-family>/<package-file>`.

```text
  o<  wowowweewow!!!
`/)
 ^^
```

With some tweaks, we can proceed to generate packages for even more distributions. See [examples/sh/demo](demo).

You've gone from source code, to executables, to installers. And we haven't even shown multi-architecture package generation. Congratulations, you're already above and beyond.

Remember to test your shiny new packages. Install them into a fresh environment. Run your apps. Kick the tires!

## CLI Flags

### `--name <name>`

Required, nonblank.

The name of your package.

Example: `"hello"`

### `--version <version>`

Required, nonblank.

[SemVer](https://semver.org/)

Example: `"1.0.0"`

### `--release <release>`

Required, nonblank.

An incrementing revision identifier.

Example: `"1"`

## `--arch <architecture>`

Required, nonblank.

Syntax relative to target OS.

Examples:

* `"all"` (ISA independent Debian)
* `"noarch"` (ISA independent RHEL)
* `"i386"` (32 bit Intel/AMD Debian)
* `"i686"` (32 bit Intel/AMD RHEL)
* `"amd64"` (64 bit Intel/AMD Debian)
* `"x86_64"` (64 bit Intel/AMD RHEL)

Consult your target operating systems' documentation for more detail.

### `--maintainer <maintainer>`

Required, RFC822 format.

Example: `"Bob <bob@bobsautoparts.test>"`

### `--summary <summary>`

Requirement varies relative to target OS.

A short description of your package.

Example: `"greeter"`

### `--description <description>`

Required, nonblank.

Example: `"greeter"`

### `--copyright <copyright>`

Optional.

Example: `"Copyright (c) 2026 Bob"`

### `--license <license>`

Required, nonblank.

A license identifier.

Commonly [SPDX](https://spdx.org/licenses/), though syntax may be relative to target OS. Consult your target operating systems' documentation for more detail.

Examples:

* `"0BSD"`
* `"Apache-2.0"`
* `"BSD-3-Clause"`
* `"GPL-3.0-or-later"`

rockhopper combines copyright and license into a terse `LICENSE` file in each package artifact. To customize the contents, layout a `LICENSE` file within your `rockhopper-data` tree, relative to your operating systems' specific filesystem hierarchy.

### `--dependencies <dependencies>`

Optional.

Prerequisite package constraints.

Syntax relative to target OS. Consult your target operating systems' documentation for more detail.

### `--changelog-file <path>`

RHEL, Fedora, and other RPM based distributions use [Fedora: Manual Changelog](https://docs.fedoraproject.org/en-US/packaging-guidelines/manual-changelog/) syntax.

Requirement and content varies relative to target OS. Consult your operating systems' documentation for more detail.

### `--url <homepage>`

Required, nonblank.

A network directory housing your software.

Example: `"https://bobsautoparts.test/"`

# ROCKHOPPER IMAGE STRUCTURE

Images abstract the low level shell commands involved in generating packages, into a common Docker workflow.

Image design:

* standard operating system package building tools
* a `rockhopper` shell script that receives all the configurable [CLI flags](#flags) and writes a basic, functioning, package file. (Stubs welcome!)
* Read application assets from `/src` (e.g. `docker run -v "$(pwd):/src" <image> --name hello --version hello ...`).
* Write package files to `/src/.rockhopper/<os-family>/<basename>`.

This adaptable structure, empowers users to essentially copy and paste build configurations for many combinations of operating systems and architectures.

You can even for-loop over a small subset of OS-relative flags!

Plenty of other Linux distributions exist, beyond those of our stock images! Users are encouraged to publish and exchange similar rockhopper images.

A dream of impossible colors... Let's make vendor lock a thing of the past.

```text
  -< zzZ... *as if!* zzZ...
,/)
 ^^
```

# SEE ALSO

* [crit](https://github.com/mcandre/crit), an automated Rust multiplatform compiler
* [factorio](https://github.com/mcandre/factorio), an automated Go multiplatform compiler
* [fpm](https://github.com/jordansissel/fpm), an older, host native package generator
* [tuggy](https://github.com/mcandre/tuggy), an automated Docker multiplatform image builder

🐧
