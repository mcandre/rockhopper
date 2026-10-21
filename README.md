# rockhopper: metapackage generator

[![Docker Pulls](https://img.shields.io/docker/pulls/n4jm4/rockhopper)](https://hub.docker.com/r/n4jm4/rockhopper) [![Crates.io Downloads (recent)](https://img.shields.io/crates/dr/rockhopper?label=crate%20downloads)](https://crates.io/crates/rockhopper) [![docs.rs](https://img.shields.io/docsrs/rockhopper)](https://docs.rs/rockhopper/latest/rockhopper/) [![license](https://img.shields.io/badge/license-BSD-0)](LICENSE.md) [![Donate](https://img.shields.io/badge/%E2%99%A5-Sponsor-BF3988)](https://github.com/sponsors/mcandre)

```text
  o<  gak! gak!
-/)
 ^^
```

# ABOUT

rockhopper builds packages for a wide variety of platforms.

BYOB (Bring Your Own Binaries).

# EXAMPLES

```console
% cd examples/go

% rockhopper

% tree .rockhopper/artifacts
.rockhopper/artifacts
├── alpine-linux
│   ├── raygun-0.0.1-r1.aarch64.apk
│   └── raygun-0.0.1-r1.x86_64.apk
├── appimage
│   ├── raygun-0.0.1-1-aarch64.AppImage
│   └── raygun-0.0.1-1-x86_64.AppImage
├── fedora
│   ├── raygun-0.0.1-1.aarch64.rpm
│   └── raygun-0.0.1-1.x86_64.rpm
...
```

rockhopper is programming language agnostic. For more programming language samples, see [examples](examples).

# DOWNLOAD

```sh
cargo install rockhopper
```

## Prerequisites

* [cargo](https://doc.rust-lang.org/cargo/)
* [Docker](https://www.docker.com/)

## Postinstall

Register `~/.cargo/bin` to `PATH` environment variable.

For details on tuning rockhopper, see [CONFIGURATION](CONFIGURATION.md).

For details on building from source, see [DEVELOPMENT](DEVELOPMENT.md).

# DOCKER IMAGES

[Docker Hub](https://hub.docker.com/r/n4jm4/rockhopper)

Image Pattern: `n4jm4/rockhopper:<tag>`

| Package Manager | File Extension | Distro Primary | Docker Tag |
| --------------- | -------------- | -------------- | -----------|
| [apk](https://wiki.alpinelinux.org/wiki/Alpine_Package_Keeper) | apk | Alpine Linux | `alpine-linux` |
| [AppImage](https://appimage.org/) | AppImage | (generic Linux) | `appimage` |
| [apt](https://ubuntu.com/server/docs/how-to/software/package-management/) | deb | Ubuntu | `ubuntu` |
| [dnf](https://dnf5.readthedocs.io/en/latest/) | rpm | Fedora | `fedora` |
| [installer](https://ss64.com/mac/installer.html) | pkg | macOS | `macos` |
| [msiexec](https://learn.microsoft.com/en-us/windows/win32/msi/command-line-options) | msi | Windows | `windows` |
| [pkg](https://docs.freebsd.org/en/books/handbook/ports/) | pkg | FreeBSD | `freebsd` |
| [pkg_add (NetBSD)](https://man.netbsd.org/pkg_add.1) | tgz | NetBSD | `netbsd` |
| [pkg_add (OpenBSD)](https://man.openbsd.org/pkg_add.1) | tgz | OpenBSD | `openbsd` |
| [tar (PAX)](https://pubs.opengroup.org/onlinepubs/7908799/xcu/tar.html) | tgz | (generic UNIX ) | `tarball` |

Multiplatform images also available. Supported platforms may vary by distro. Version pin tag aliases are also available, of the form:

`[<rockhopper-version>-]<distro>[-<release-nickname]`

*Distro Primary* refers to a predominant operating system (e.g. Ubuntu) for a package manager type (e.g. apt). Some packages may interoperate with similar operating systems (e.g. Debian, Linux Mint, Pop!_OS, Raspberry Pi OS, WSL, et. al.) If necessary, create a custom image for your specific platform.

For information on developing custom rockhopper images, see the [rocklets interface](ROCKLETS.md).

# TIPS

Fully static [Go](https://go.dev/)/[musl](https://musl.libc.org/) binaries tend to improve portability for compiled applications.

Lost? Try [Raspberry Pi for Dummies](https://www.amazon.com/Raspberry-Pi-Dummies-Sean-McManus/dp/1119796822/). *We all gotta start somewhere.*

A dream of impossible colors... Let's make vendor lock a thing of the past.

```text
  -< zzZ... *as if!* zzZ...
,/)
 ^^
```

# RESOURCES

Prior art, personal plugs, and tools for developing portable applications (including non-Rust projects)!

* [alien](https://joeyh.name/code/alien/) - an OS package converter
* [apple-platform-rs](https://github.com/indygreg/apple-platform-rs), [bomutils](https://github.com/hogliux/bomutils), [stuckliste](https://github.com/igankevich/stuckliste) - Apple Bom format research
* [cargo](https://doc.rust-lang.org/cargo/) - a crossplatform package manager for Rust projects
* [fpm](https://github.com/jordansissel/fpm) - an older, host native package generator
* [go mod](https://go.dev/doc/modules/gomod-ref) - a crossplatform package manager for Go applications
* [goreleaser](https://goreleaser.com/) - a crossplatform binary & package generator
* [mcandre/crit](https://github.com/mcandre/crit) - an automated Rust multiplatform compiler
* [mcandre/tuco](https://github.com/mcandre/tuco) - an automated Go multiplatform compiler
* [n4jm4/raspberry-pi-os](https://hub.docker.com/r/n4jm4/raspberry-pi-os) - a Docker base image for Raspberry Pi OS
* [msitools](https://gitlab.gnome.org/GNOME/msitools) - a Linux framework for generating Windows MSI packages
* [tree](https://en.wikipedia.org/wiki/Tree_(command)) - recursive directory browser
* [UTM](https://mac.getutm.app/) - a macOS emulator with support for NetBSD and other operating systems
* [xgo](https://github.com/techknowlogick/xgo) - an automated cGo multiplatform compiler

🐧
