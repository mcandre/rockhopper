# rockhopper: Linux package generator

```text
  o<  gak! gak!
-/)
 ^^
```

# ABOUT

rockhopper automates install media generation for a wide variety of Linux distributions.

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

# USAGE

rockhopper transforms application assets into installer packages. Here's how to do it!

1. Create a `data` directory. Within `data`, layout all of your application's assets as they should appear on the end user's machine after installation. Apply the desired uid's, gid's, and chmod permissions to your entries. Linux, UNIX, and many other operating systems follow the [Filesystem Hierarchy Standard](https://specifications.freedesktop.org/fhs/latest/).

Example:

```console
$ tree
.
└── data
    └── usr
        └── bin
            └── hello
```

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

rockhopper forwards the configuration to the target OS build commands for package generation.

Packages write to `.rockhopper/<os-family>/<package-file>`.

Example:

```console
% tree .rockhopper
.rockhopper
└── debian
    └── hello_1.0.0-1_all.deb
```

rockhopper encourages developers to support multiple platforms. With minor tweaks, we quickly generate packages for multiple platforms. See [examples/sh/demo](demo).

## Flags

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

rockhopper combines copyright and license into a terse `LICENSE` file in each package artifact. To customize the contents, layout a `LICENSE` file within your `data` tree, relative to your operating systems' specific filesystem hierarchy.

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

# SEE ALSO

* [crit](https://github.com/mcandre/crit), an automated Rust multiplatform compiler
* [factorio](https://github.com/mcandre/factorio), an automated Go multiplatform compiler
* [fpm](https://github.com/jordansissel/fpm), an older, host native package generator
* [tuggy](https://github.com/mcandre/tuggy), an automated Docker multiplatform image builder

🐧
