# DEVELOPMENT GUIDE

rockhopper follows standard, cargo based operations for compiling and unit testing Rust code.

For advanced operations, such as linting, managing multiplatform Docker images, and so on, we further supplement with some software industry tools.

# BUILDTIME REQUIREMENTS

* a UNIX-like environment (e.g. [WSL](https://learn.microsoft.com/en-us/windows/wsl/))
* [awscli](https://aws.amazon.com/cli/)
* [bash](https://www.gnu.org/software/bash/) 4+
* [Docker](https://www.docker.com/) 28.0.1+
* POSIX compliant [make](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/make.html)
* [tree](https://en.wikipedia.org/wiki/Tree_(command))

## Recommended

* a host capable of running musl/Linux containers (e.g. a GNU/Linux, musl/Linux, macOS, or Windows host)
* [Docker First Aid Kit](https://github.com/mcandre/docker-first-aid-kit)
* Apple Silicon macOS users may want to apply `DOCKER_DEFAULT_PLATFORM=linux/amd64`, as many industry Docker images lag behind in ARM support
* [GNU time](https://www.gnu.org/software/time/)

# BUILD APP

```sh
make
```

# BUILD IMAGES

```sh
make docker-build
```

# TEST

```sh
make test
```

# TEST PUSH IMAGES

```sh
make docker-test
```

# PUSH IMAGES

```sh
make push
```

# PORT

```sh
make port
```

# PACKAGE

```sh
make package
```

# UPLOAD PACKAGES

```sh
make upload
```

# CLEAN

```sh
make clean
```
