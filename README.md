# rockhopper: metapackage generator

[![Docker Pulls](https://img.shields.io/docker/pulls/n4jm4/rockhopper)](https://hub.docker.com/r/n4jm4/rockhopper) [![license](https://img.shields.io/badge/license-BSD-0)](LICENSE.md) [![Donate](https://img.shields.io/badge/GUMROAD-36a9ae?style=flat&logo=gumroad&logoColor=white)](https://mcandre.gumroad.com/)

```text
  o<  gak! gak!
-/)
 ^^
```

# SUMMARY

rockhopper generates installer packages for a wide variety of platforms.

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
├── fedora
│   └── hello-1.0.0-1.noarch.rpm
├── mint
│   └── hello_1.0.0-1_all.deb
├── slack
│   └── hello-1.0.0-1-noarch-build.tgz
└── ubuntu
    └── hello_1.0.0-1_all.deb
```

# INSTALLATION

See [INSTALL.md](INSTALL.md).

# ABOUT

rockhopper bundles all the tools needed to generate packages, inside Docker containers.

## Rockhopper Images

| Distro                 | Image                   |
| ---------------------- | ----------------------- |
| Alpine Linux           | n4jm4/rockhopper:alpine |
| Arch Linux             | n4jm4/rockhopper:arch   |
| Debian                 | n4jm4/rockhopper:debian |
| Fedora                 | n4jm4/rockhopper:fedora |
| Linux Mint             | n4jm4/rockhopper:mint   |
| Slackware              | n4jm4/rockhopper:slack  |
| Ubuntu / Windows (WSL) | n4jm4/rockhopper:ubuntu |

Windows users may gain access to Ubuntu via [WSL](https://learn.microsoft.com/en-us/windows/wsl/).

[Version pin tags](https://hub.docker.com/r/n4jm4/rockhopper/tags) also available.

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

With minor tweaks, it's possible to extend support for even more distributions. See [examples/sh/demo](examples/sh/demo).

You've gone from source code, to executables, to installers. Congratulations, you're above and beyond.

Remember to test your shiny new packages. Install them into a fresh environment. Run your apps. Kick the tires!

# CONFIGURATION

For more usage options, see [CONFIGURATION.md](CONFIGURATION.md).

# ROCKLETS

For information on provisioning your own custom package building images, see the [ROCKLETS](ROCKLETS.md) interface.

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
