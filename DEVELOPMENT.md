# DEVELOPMENT

We follow standard, `cargo` based operations for compiling and unit testing Rust code.

For advanced operations, such as linting, we further supplement with some software industry tools.

# DEV ENVIRONMENT

## Prerequisites

* a UNIX-like environment (e.g. [WSL](https://learn.microsoft.com/en-us/windows/wsl/))
* [Docker](https://www.docker.com/)
* [Go](https://go.dev/)
* [jq](https://jqlang.org/)
* [make](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/make.html)
* [Rust](https://www.rust-lang.org/en-US/)
* [ShellCheck](https://www.shellcheck.net/) 0.11.0+
* Provision additional dev tools with `make -f install.mk`

## Recommended

* [asdf](https://asdf-vm.com/)

## Postinstall

Register output of `go env GOBIN` to `PATH` environment variable.

Register `~/.cargo/bin` to `PATH` environment variable.

# TASKS

We automate engineering tasks.

## Build

```sh
make
```

## Install

```sh
make install
```

## Uninstall

```sh
make uninstall
```

## Security Audit

```sh
make audit
```

## Build Images

```sh
make docker-build
```

## Lint

```sh
make lint
```

## Test

```sh
make test
```

## Publish Crate

```sh
make publish
```

## Test Push Images

```sh
make docker-test
```

## Push Images

```sh
make push
```

## Clean Workspace

```sh
make clean
```
