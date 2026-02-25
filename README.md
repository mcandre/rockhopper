# rockhopper: metapackage generator

[![Docker Pulls](https://img.shields.io/docker/pulls/n4jm4/rockhopper)](https://hub.docker.com/r/n4jm4/rockhopper) [![Crates.io Downloads (recent)](https://img.shields.io/crates/dr/rockhopper?label=crate%20downloads)](https://crates.io/crates/rockhopper) [![GitHub Downloads](https://img.shields.io/github/downloads/mcandre/rockhopper/total?logo=github)](https://github.com/mcandre/rockhopper/releases) [![docs.rs](https://img.shields.io/docsrs/rockhopper)](https://docs.rs/rockhopper/latest/rockhopper/) [![license](https://img.shields.io/badge/license-BSD-0)](LICENSE.md) [![Donate](https://img.shields.io/badge/-any?logo=gumroad&label=Donate&color=grey)](https://mcandre.gumroad.com/)

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

$ tree .rockhopper
.rockhopper
├── alpine-linux
│   └── raygun-1.2.3-r81.noarch.apk
├── fedora
│   └── raygun-1.2.3-81.noarch.rpm
└── ubuntu
    └── raygun_1.2.3-81_all.deb
```

See `rockhopper -h` for more options.

# DOWNLOAD

rockhopper images may be run individually.

```sh
docker pull -a n4jm4/rockhopper
```

rockhopper images use environment variables (`rocklet_`... prefix) for configuration.

## Stock Images

rockhopper organizes package generators by distro.

| Target                 | Tag          |
| ---------------------- | ------------ |
| Alpine Linux           | alpine-linux |
| Fedora                 | fedora       |
| Ubuntu / Windows (WSL) | ubuntu       |

[Version pin tags](https://hub.docker.com/r/n4jm4/rockhopper/tags) also available, of the form:

`<rockhopper version>-<distro>`

Multiplatform images available. Supported platforms may vary by distro.

Pro tip: A happy consequence of building Ubuntu packages, is that Windows users can then access your applications via [WSL](https://learn.microsoft.com/en-us/windows/wsl/).

Note: Our stock images emphasize build binary based packages.

For information on developing custom rockhopper images, see the [rocklets interface](ROCKLETS.md).

## System Requirements

Host Operating Systems:

* Linux
* macOS
* UNIX
* Windows native or [WSL](https://learn.microsoft.com/en-us/windows/wsl/)

Host Architectures:

* ARM
* Intel

For more platforms and installation methods, see our [install guide](INSTALL.md).

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
