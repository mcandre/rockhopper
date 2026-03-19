# DEVELOPMENT GUIDE

rockhopper follows standard, cargo based operations for compiling and unit testing Rust code.

For advanced operations, such as linting, we further supplement with some software industry tools.

# BUILDTIME REQUIREMENTS

## Prerequisites

* a UNIX-like environment (e.g. [WSL](https://learn.microsoft.com/en-us/windows/wsl/))
* [bash](https://www.gnu.org/software/bash/) 4+
* [Docker](https://www.docker.com/)
* [jq](https://jqlang.org/)
* [make](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/make.html)
* [Rust](https://www.rust-lang.org/en-US/)
* Provision additional dev tools with `make -f install.mk`

## Recommended

* [asdf](https://asdf-vm.com/) 0.18

## Postinstall

Register `~/.cargo/bin` to `PATH` environment variable.

# INSTALL APP

```sh
make [install]
```

# UNINSTALL APP

```sh
make uninstall
```

# BUILD IMAGES

```sh
make docker-build
```

# TEST

```sh
make test
```

# PUBLISH CRATE

```sh
make publish
```

# TEST PUSH IMAGES

```sh
make docker-test
```

# PUSH IMAGES

```sh
make push
```

# CLEAN

```sh
make clean
```
