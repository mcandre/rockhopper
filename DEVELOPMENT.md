# DEVELOPMENT GUIDE

rockhopper follows standard UNIX operations for running shell code.

# BUILDTIME REQUIREMENTS

* a UNIX-like environment (e.g. [WSL](https://learn.microsoft.com/en-us/windows/wsl/))
* [awscli](https://aws.amazon.com/cli/)
* [bash](https://www.gnu.org/software/bash/) 4+
* [Docker](https://www.docker.com/) 28.0.1+
* GNU [grep](https://www.gnu.org/software/grep/)
* POSIX compliant [make](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/make.html)
* [tree](https://en.wikipedia.org/wiki/Tree_(command))
* [uuidgen](https://linux.die.net/man/1/uuidgen)

## Recommended

* a host capable of running musl/Linux containers (e.g. a GNU/Linux, musl/Linux, macOS, or Windows host)
* [Docker First Aid Kit](https://github.com/mcandre/docker-first-aid-kit)
* Apply `DOCKER_DEFAULT_PLATFORM` = `linux/amd64` environment variable
* [GNU time](https://www.gnu.org/software/time/)

# BUILD

```sh
make
```

# TEST

```sh
make test
```

# PUSH DOCKER IMAGES

```sh
make push
```

# PORT

```sh
make port
```

# CloudFlare R2 UPLOAD

```sh
make upload
```

# CLEAN

```sh
make clean
```
