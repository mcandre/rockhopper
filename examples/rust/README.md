# raygun

My Illudium Q-36 space modulator!

# RUNTIME REQUIREMENTS

(None)

# BUILDTIME REQUIREMENTS

* a UNIX-like environment (e.g. [WSL](https://learn.microsoft.com/en-us/windows/wsl/))
* [Docker](https://www.docker.com/) 28.0.1+
* POSIX compliant [make](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/make.html)
* [Rust](https://www.rust-lang.org/en-US/)
* Provision additional dev tools with `make -f install.mk`

# RUN

```sh
raygun
```

# PUBLISH CRATE

```sh
make publish
```

# CROSSCOMPILE BINARIES

```sh
make crit
```

# PACKAGE BINARIES

```sh
make package
```
