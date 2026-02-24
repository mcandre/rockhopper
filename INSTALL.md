# INSTALL GUIDE

In addition to OS packages, rockhopper also supports alternative installation methods.

# INSTALL (CARGO)

rockhopper is packaged as a Rust crate.

```sh
cargo install rockhopper
```

Prerequisites:

* [cargo](https://doc.rust-lang.org/cargo/)

# INSTALL (CURL)

```sh
curl -L https://raw.githubusercontent.com/mcandre/rockhopper/refs/heads/main/install-rockhopper | sh
```

## Postinstall

Ensure `$HOME/.local/bin` is registered with your shell's `PATH` environment variable.

## Uninstall

```sh
curl -L https://raw.githubusercontent.com/mcandre/rockhopper/refs/heads/main/uninstall-rockhopper | sh
```

## System Requirements

Bitness: 64

Hosts:

* FreeBSD (Intel)
* macOS (ARM, Intel)
* NetBSD (Intel)
* Linux (ARM, Intel)
* Illumos (Intel)
* Windows (ARM, Intel) via [WSL](https://learn.microsoft.com/en-us/windows/wsl/)

Prerequisites:

* [bash](https://www.gnu.org/software/bash/) 4+
* [curl](https://curl.se/)

# INSTALL (PRECOMPILED BINARIES)

Precompiled binaries may be installed manually.

## Install

1. Download a [tarball](https://github.com/mcandre/rockhopper/releases) corresponding to your environment's architecture and OS.
2. Extract executables into a selected directory.

   Examples:

   * `~/.local/bin` (XDG compliant per-user)
   * `/usr/local/bin` (XDG compliant global)
   * `~/bin` (BSD)
   * `~\AppData\Local` (native Windows)

## Postinstall

Ensure the selected directory is registered with your shell's `PATH` environment variable.

## Uninstall

Remove the application executables from the selected directory.

## System Requirements

Bitness: 64

Hosts:

* FreeBSD (Intel)
* macOS (ARM, Intel)
* NetBSD (Intel)
* Linux (ARM, Intel)
* Illumos (Intel)
* Windows (ARM, Intel) native or [WSL](https://learn.microsoft.com/en-us/windows/wsl/)

# INSTALL (COMPILE FROM SOURCE)

```sh
git clone https://github.com/mcandre/rockhopper.git
cd rockhopper
cargo install --force --path .
```

## System Requirements

Prerequisites:

* [cargo](https://doc.rust-lang.org/cargo/)

For more details on developing rockhopper itself, see our [development guide](DEVELOPMENT.md).
