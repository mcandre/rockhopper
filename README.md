# rockhopper: metapackage generator

[![CloudFlare R2 install media downloads](https://img.shields.io/badge/Cloudflare-F28220?style=for-the-badge&logo=Cloudflare&logoColor=white&style=flat)](#download) [![Docker Pulls](https://img.shields.io/docker/pulls/n4jm4/rockhopper)](https://hub.docker.com/r/n4jm4/rockhopper) [![Crates.io Downloads (recent)](https://img.shields.io/crates/dr/rockhopper?label=crate%20downloads)](https://crates.io/crates/rockhopper) [![GitHub Downloads](https://img.shields.io/github/downloads/mcandre/rockhopper/total?logo=github)](https://github.com/mcandre/rockhopper/releases) [![docs.rs](https://img.shields.io/docsrs/rockhopper)](https://docs.rs/rockhopper/latest/rockhopper/) [![license](https://img.shields.io/badge/license-BSD-0)](LICENSE.md) [![Donate](https://img.shields.io/badge/-any?logo=gumroad&label=Donate&color=grey)](https://mcandre.gumroad.com/)

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

$ rockhopper

$ tree .rockhopper/artifacts
.rockhopper/artifacts
├── alpine-linux
│   └── raygun-1.2.3-r81.noarch.apk
├── fedora
│   └── raygun-1.2.3-81.noarch.rpm
├── macos
│   └── raygun-universal-1.2.3-81.pkg
└── ubuntu
    └── raygun_1.2.3-81_all.deb
```

See `rockhopper -h` for more options.

# DOWNLOAD

| Host                   | Package |
| ---------------------- | ------- |
| Alpine Linux           | [ARM](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.15/alpine-linux/rockhopper-0.0.15-r1.aarch64.apk) / [Intel](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.15/alpine-linux/rockhopper-0.0.15-r1.x86_64.apk) |
| Fedora                 | [ARM](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.15/fedora/rockhopper-0.0.15-1.aarch64.rpm) / [Intel](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.15/fedora/rockhopper-0.0.15-1.x86_64.rpm) |
| macOS | [ARM](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.15/macos/rockhopper-arm64-0.0.15-1.pkg) / [Intel](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.15/macos/rockhopper-x86_64-0.0.15-1.pkg) |
| Ubuntu / Windows (WSL) | [ARM](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.15/ubuntu/rockhopper_0.0.15-1_arm64.deb) / [Intel](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.15/ubuntu/rockhopper_0.0.15-1_amd64.deb) |

# System Requirements

## Host Operating Systems

* Alpine Linux
* Fedora
* macOS
* Ubuntu
* Windows via [WSL](https://learn.microsoft.com/en-us/windows/wsl/)

## Host Architectures

* 64-bit ARM
* 64-bit Intel

For more host platforms and installation methods, see our [install guide](INSTALL.md).

# STOCK IMAGES

rockhopper organizes package generators by distro.

| Target                 | Tag          |
| ---------------------- | ------------ |
| Alpine Linux           | alpine-linux |
| Fedora                 | fedora       |
| macOS                  | macos        |
| Ubuntu / Windows (WSL) | ubuntu       |

[Version pin tags](https://hub.docker.com/r/n4jm4/rockhopper/tags) also available, of the form:

`<rockhopper version>-<distro>`

Multiplatform images available. Supported platforms may vary by distro.

Pro tip: A happy consequence of building Ubuntu packages, is that Windows users can then access your applications via [WSL](https://learn.microsoft.com/en-us/windows/wsl/).

Note: Our stock images emphasize build binary based packages.

For information on developing custom rockhopper images, see the [rocklets interface](ROCKLETS.md).

# RUNTIME REQUIREMENTS

* a [docker](https://www.docker.com/) CLI

## Recommended

* a UNIX-like environment (e.g. [WSL](https://learn.microsoft.com/en-us/windows/wsl/))
* a host capable of running musl/Linux containers (e.g. a GNU/Linux, musl/Linux, macOS, or Windows host)
* [Docker First Aid Kit](https://github.com/mcandre/docker-first-aid-kit)
* Apple Silicon macOS users may want to apply `DOCKER_DEFAULT_PLATFORM=linux/amd64`, as many industry Docker images lag behind in ARM support
* GNU [time](https://www.gnu.org/software/time/)
* [tree](https://en.wikipedia.org/wiki/Tree_(command))

# ABOUT

rockhopper bundles all the tools needed to generate packages, inside Docker containers.

# CONFIGURATION

For information on configuring rockhopper, see our [configuration guide](CONFIGURATION.md).

# TIPS

Fully static [Go](https://go.dev/)/[musl](https://musl.libc.org/) binaries tend to improve portability for compiled applications.

Lost? Try [Raspberry Pi for Dummies](https://www.amazon.com/Raspberry-Pi-Dummies-Sean-McManus/dp/1119796822/). *We all gotta start somewhere.*

A dream of impossible colors... Let's make vendor lock a thing of the past.

```text
  -< zzZ... *as if!* zzZ...
,/)
 ^^
```

# SEE ALSO

* [alien](https://joeyh.name/code/alien/), an OS package converter
* [cargo](https://doc.rust-lang.org/cargo/), a crossplatform package manager for Rust projects
* [chandler](https://github.com/mcandre/chandler), an OS agnostic tar normalizer
* [crit](https://github.com/mcandre/crit), an automated Rust multiplatform compiler
* [factorio](https://github.com/mcandre/factorio), an automated Go multiplatform compiler
* [fpm](https://github.com/jordansissel/fpm), an older, host native package generator
* [go mod](https://go.dev/doc/modules/gomod-ref), a crossplatform package manager for Go applications
* [tuggy](https://github.com/mcandre/tuggy), an automated Docker multiplatform image builder
* [xgo](https://github.com/techknowlogick/xgo), an automated cGo multiplatform compiler

🐧
