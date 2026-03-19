# INSTALL GUIDE

rockhopper supports alternative installation methods.

# INSTALL (COMPILE FROM SOURCE)

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
