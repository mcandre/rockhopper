# INSTALL GUIDE

In addition to OS packages, rockhopper also supports alternative installation methods.

# INSTALL (CARGO REMOTE)

rockhopper is packaged as a Rust crate.

```sh
cargo install rockhopper
```

## Prerequisites

* [cargo](https://doc.rust-lang.org/cargo/)

## Postinstall

Register `~/.cargo/bin` to `PATH` environment variable.

# INSTALL (CARGO LOCAL)

rockhopper may be compiled from source.

```sh
git clone https://github.com/mcandre/rockhopper.git
cd rockhopper
cargo install --force --path .
```

## Prerequisites

* [cargo](https://doc.rust-lang.org/cargo/)
* [git](https://git-scm.com/)

## Postinstall

Register `~/.cargo/bin` to `PATH` environment variable.

For more details on developing rockhopper, see our [development guide](DEVELOPMENT.md).
