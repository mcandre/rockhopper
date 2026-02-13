# rockhopper: metapackage generator

[![CloudFlare R2 install media downloads](https://img.shields.io/badge/Cloudflare-F28220?style=for-the-badge&logo=Cloudflare&logoColor=white&style=flat)](#download) [![Docker Pulls](https://img.shields.io/docker/pulls/n4jm4/rockhopper)](https://hub.docker.com/r/n4jm4/rockhopper) [![license](https://img.shields.io/badge/license-BSD-0)](LICENSE.md) [![Donate](https://img.shields.io/badge/-any?logo=gumroad&label=Donate&color=grey)](https://mcandre.gumroad.com/)

```text
  o<  gak! gak!
-/)
 ^^
```

# SUMMARY

rockhopper generates installer packages for a wide variety of platforms.

Distro hoppers, enjoy~

# EXAMPLE

```console
$ cd example/sh

$ ./demo

$ tree .rockhopper
.rockhopper
├── alpine-linux
│   └── hello-1.0.0-r1.noarch.apk
├── arch-linux
│   └── hello-1.0.0-1-any.pkg.tar.zst
├── crux-x86_64
│   └── hello#1.0.0-1.pkg.tar.gz
...
```

# DOWNLOAD

| Distro       | Package |
| ------------ | ------- |
| Alpine Linux | [rockhopper-0.0.8-r1.noarch.apk](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.8/alpine-linux/rockhopper-0.0.8-r1.noarch.apk) |
| Arch Linux | [rockhopper-0.0.8-1-any.pkg.tar.zst](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.8/arch-linux/rockhopper-0.0.8-1-any.pkg.tar.zst) |
| CRUX | [rockhopper#0.0.8-1.pkg.tar.gz](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.8/crux-x86_64/rockhopper%230.0.8-1.pkg.tar.gz) |
| Debian | [rockhopper_0.0.8-1_all.deb](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.8/debian/rockhopper_0.0.8-1_all.deb) |
| Fedora | [rockhopper-0.0.8-1.noarch.rpm](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.8/fedora/rockhopper-0.0.8-1.noarch.rpm) |
| Slackware Linux | [rockhopper-0.0.8-1-noarch-build.tgz](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.8/slackware-linux/rockhopper-0.0.8-1-noarch-build.tgz) |
| Ubuntu / Windows (WSL) | [rockhopper_0.0.8-1_all.deb](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.8/ubuntu/rockhopper_0.0.8-1_all.deb) |
| Void Linux (musl) | [rockhopper-0.0.8_1.noarch.xbps](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.8/void-linux/rockhopper-0.0.8_1.noarch.xbps) |

For more installation methods, see our [install guide](INSTALL.md).

For information on developing custom rockhopper package generators, see the [rocklets interface](ROCKLETS.md).

For more details on developing rockhopper itself, see our [development guide](DEVELOPMENT.md).

## Runtime Requirements

* [bash](https://www.gnu.org/software/bash/) 4+
* [Docker](https://www.docker.com/) 28.0.1+
* GNU [grep](https://www.gnu.org/software/grep/)

## Recommended

* a UNIX-like environment (e.g. [WSL](https://learn.microsoft.com/en-us/windows/wsl/))
* a host capable of running musl/Linux containers (e.g. a GNU/Linux, musl/Linux, macOS, or Windows host)
* [Docker First Aid Kit](https://github.com/mcandre/docker-first-aid-kit)
* Apply `DOCKER_DEFAULT_PLATFORM` = `linux/amd64` environment variable
* [GNU time](https://www.gnu.org/software/time/)
* [tree](https://en.wikipedia.org/wiki/Tree_(command))

# ABOUT

rockhopper bundles all the tools needed to generate packages, inside Docker containers.

## Rockhopper Images

| Distro                 | Image                            |
| ---------------------- | -------------------------------- |
| Alpine Linux           | n4jm4/rockhopper:alpine-linux    |
| Arch Linux             | n4jm4/rockhopper:arch            |
| CRUX                   | n4jm4/rockhopper:crux            |
| Debian                 | n4jm4/rockhopper:debian          |
| Fedora                 | n4jm4/rockhopper:fedora          |
| Slackware Linux        | n4jm4/rockhopper:slackware-linux |
| Ubuntu / Windows (WSL) | n4jm4/rockhopper:ubuntu          |
| Void Linux (musl)      | n4jm4/rockhopper:void-linux-musl |

Windows users may gain access to Ubuntu via [WSL](https://learn.microsoft.com/en-us/windows/wsl/).

[Version pin tags](https://hub.docker.com/r/n4jm4/rockhopper/tags) also available, of the form:

`n4jm4/rockhopper:<rockhopper version>-<distro>`

# USAGE

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

Pro tip: Target dynamic scripts, pure Go binaries, or fully static musl binaries. These do not depend on glibc, often a sticking point for cross-distro compatibility.

2. Inside your project, create a `rockhopper-data` subdirectory. Within `rockhopper-data`, layout all of your application's assets as they should appear on the end user's machine after installation.

Linux, and many UNIX style operating systems follow the [Filesystem Hierarchy Standard](https://specifications.freedesktop.org/fhs/latest/).

Example:

```console
$ tree
.
└── rockhopper-data
    └── usr
        └── bin
            └── hello
```

Shell scripts and other interpreted executables may be checked this way into version control. For binary assets, configure `make` or another build system, to copy the files there dynamically.

3. Configure target platform.

Example:

```sh
export ROCKHOPPER_NAME='hello'
export ROCKHOPPER_VERSION='1.0.0'
export ROCKHOPPER_MAINTAINER='Bob Loblaw <bob@bananastand.test>'
export ROCKHOPPER_DESCRIPTION='hello world welcomes new developers'
export ROCKHOPPER_COPYRIGHT='Copyright (C) 2026 Bob'
export ROCKHOPPER_LICENSE='0BSD'
export ROCKHOPPER_IMAGE='n4jm4/rockhopper:debian'
export ROCKHOPPER_ARCH='all'
```

Note: Customize `ROCKHOPPER_ARCH` to match each of your target ISA(s).

Note: Debian and other distros often have additional optional and/or required fields.

4. Generate packages and verify.

```sh
$ rockhopper

$ tree .rockhopper
.rockhopper
└── debian
    └── hello_1.0.0_all.deb
```

Packages write to `.rockhopper/<distro>/<package-file>`.

```text
  o<  wowowweewow!!!
`/)
 ^^
```

With minor tweaks, it's possible to extend support for even more distributions. See [example/sh/demo](example/sh/demo).

You've gone from source code, to executables, to installers. Congratulations, you're above and beyond.

Remember to test your shiny new packages. Install them into a fresh environment. Run your apps. Kick the tires!

# CONFIGURATION

For more usage options, see [CONFIGURATION.md](CONFIGURATION.md).

A dream of impossible colors... Let's make vendor lock a thing of the past.

```text
  -< zzZ... *as if!* zzZ...
,/)
 ^^
```

# SEE ALSO

* [chandler](https://github.com/mcandre), an OS agnostic tar normalizer
* [crit](https://github.com/mcandre/crit), an automated Rust multiplatform compiler
* [factorio](https://github.com/mcandre/factorio), an automated Go multiplatform compiler
* [fpm](https://github.com/jordansissel/fpm), an older, host native package generator
* [tuggy](https://github.com/mcandre/tuggy), an automated Docker multiplatform image builder

🐧
