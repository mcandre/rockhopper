# rockhopper: metapackage generator

[![CloudFlare R2 install media downloads](https://img.shields.io/badge/Cloudflare-F28220?style=for-the-badge&logo=Cloudflare&logoColor=white&style=flat)](#download) [![Docker Pulls](https://img.shields.io/docker/pulls/n4jm4/rockhopper)](https://hub.docker.com/r/n4jm4/rockhopper) [![Crates.io Downloads (recent)](https://img.shields.io/crates/dr/rockhopper?label=crate%20downloads)](https://crates.io/crates/rockhopper) [![GitHub Downloads](https://img.shields.io/github/downloads/mcandre/rockhopper/total?logo=github)](https://github.com/mcandre/rockhopper/releases) [![docs.rs](https://img.shields.io/docsrs/rockhopper)](https://docs.rs/rockhopper/latest/rockhopper/) [![license](https://img.shields.io/badge/license-BSD-0)](LICENSE.md) [![Donate](https://img.shields.io/badge/-any?logo=gumroad&label=Donate&color=grey)](https://mcandre.gumroad.com/)

```text
  o<  gak! gak!
-/)
 ^^
```

# ABOUT

rockhopper provides a unified framework for building binary based OS packages across many kinds of platforms.

BYOB (Bring Your Own Binaries).

# EXAMPLES

```console
$ cd examples/go

$ rockhopper

$ tree .rockhopper/artifacts
.rockhopper/artifacts
├── alpine-linux
│   ├── raygun-0.0.1-r1.aarch64.apk
│   └── raygun-0.0.1-r1.x86_64.apk
├── fedora
│   ├── raygun-0.0.1-1.aarch64.rpm
│   └── raygun-0.0.1-1.x86_64.rpm
├── freebsd-amd64
│   └── raygun-0.0.1_1.pkg
├── freebsd-arm64
│   └── raygun-0.0.1_1.pkg
...
```

For more CLI options, run `rockhopper -h`.

rockhopper is programming language agnostic. For more programming language samples, see [examples](examples).

# DOWNLOAD

<table>
  <thead>
    <tr>
      <th>Host</th>
      <th colspan=2>Package</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Alpine Linux</td>
      <td><a href="https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.21/alpine-linux/rockhopper-0.0.21-r1.x86_64.apk">Intel</a></td>
      <td><a href="https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.21/alpine-linux/rockhopper-0.0.21-r1.aarch64.apk">ARM</a></td>
    </tr>
    <tr>
      <td>Fedora</td>
      <td><a href="https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.21/fedora/rockhopper-0.0.21-1.x86_64.rpm">Intel</a></td>
      <td><a href="https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.21/fedora/rockhopper-0.0.21-1.aarch64.rpm">ARM</a></td>
    </tr>
    <tr>
      <td>FreeBSD</td>
      <td><a href="https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.21/freebsd-amd64/rockhopper-0.0.21_1.pkg">Intel</a></td>
      <td></td>
    </tr>
    <tr>
      <td>macOS</td>
      <td><a href="https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.21/macos/rockhopper-x86_64-0.0.21-1.pkg">Intel</a></td>
      <td><a href="https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.21/macos/rockhopper-arm64-0.0.21-1.pkg">ARM</a></td>
    </tr>
    <tr>
      <td>NetBSD</td>
      <td><a href="https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.21/netbsd-x86_64/rockhopper-0.0.21nb1.tgz">Intel</a></td>
      <td></td>
    </tr>
    <tr>
      <td>Ubuntu</td>
      <td><a href="https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.21/ubuntu/rockhopper_0.0.21-1_amd64.deb">Intel</a></td>
      <td><a href="https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.21/ubuntu/rockhopper_0.0.21-1_arm64.deb">ARM</a></td>
    </tr>
    <tr>
      <td>Windows</td>
      <td><a href="https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.21/windows/rockhopper-0.0.21.1-x64.msi">Intel</a></td>
      <td><a href="https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.21/windows/rockhopper-0.0.21.1-arm64.msi">ARM</a></td>
    </tr>
  </tbody>
</table>

# System Requirements

## Bitness

64

For more host platforms and installation methods, see our [install guide](INSTALL.md).

# DOCKER IMAGES

[Docker Hub](https://hub.docker.com/r/n4jm4/rockhopper)

Where other package generators rely on host native tools, rockhopper abstracts package generation as Docker images. This abstraction simplifies the setup process, and reduces the impact of vendor lock for each of the host and target platforms involved.

## Stock Images

| Package Manager | File Extension | Distro Primary | Docker Tag     |
| --------------- | -------------- | -------------- | -------------- |
| apk             | `*.apk`        | Alpine Linux   | `alpine-linux` |
| apt             | `*.deb`        | Ubuntu         | `ubuntu`       |
| dnf             | `*.rpm`        | Fedora         | `fedora`       |
| installer       | `*.pkg`        | macOS          | `macos`        |
| msiexec         | `*.msi`        | Windows        | `windows`      |
| pkg             | `*.pkg`        | FreeBSD        | `freebsd`      |
| pkg_add         | `*.tgz`        | NetBSD         | `netbsd`       |

Image Pattern: `n4jm4/rockhopper:<tag>`

Multiplatform images also available. Supported platforms may vary by distro. Version pin tag aliases are also available, of the form:

`[<rockhopper-version>-]<distro>[-<release-nickname]`

Distro primaries exemplify entire families of related platforms. For example, apt serves packages for Ubuntu, but also Debian, Linux Mint, Pop!_OS, Raspberry Pi OS, WSL, et. al.

For information on developing custom rockhopper images, see the [rocklets interface](ROCKLETS.md).

# RUNTIME REQUIREMENTS

* a [docker](https://www.docker.com/) CLI

## Recommended

* a UNIX-like environment (e.g. [WSL](https://learn.microsoft.com/en-us/windows/wsl/))
* Apple Silicon macOS users may want to apply `DOCKER_DEFAULT_PLATFORM=linux/amd64`, in order to account for images commonly lacking `linux/arm64` buildx platforms
* [tree](https://en.wikipedia.org/wiki/Tree_(command))

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

# RESOURCES

Prior art, personal plugs, and tools for developing portable applications (including non-Rust projects)!

* [alien](https://joeyh.name/code/alien/) - an OS package converter
* [apple-platform-rs](https://github.com/indygreg/apple-platform-rs), [bomutils](https://github.com/hogliux/bomutils), [stuckliste](https://github.com/igankevich/stuckliste) - Apple Bom format research
* [cargo](https://doc.rust-lang.org/cargo/) - a crossplatform package manager for Rust projects
* [fpm](https://github.com/jordansissel/fpm) - an older, host native package generator
* [go mod](https://go.dev/doc/modules/gomod-ref) - a crossplatform package manager for Go applications
* [mcandre/crit](https://github.com/mcandre/crit) - an automated Rust multiplatform compiler
* [mcandre/factorio](https://github.com/mcandre/factorio) - an automated Go multiplatform compiler
* [n4jm4/raspberry-pi-os](https://hub.docker.com/r/n4jm4/raspberry-pi-os) - a Docker base image for Raspberry Pi OS
* [msitools](https://gitlab.gnome.org/GNOME/msitools) - a Linux framework for generating Windows MSI packages
* [UTM](https://mac.getutm.app/) - a macOS emulator with support for NetBSD and other operating systems
* [xgo](https://github.com/techknowlogick/xgo) - an automated cGo multiplatform compiler

🐧
