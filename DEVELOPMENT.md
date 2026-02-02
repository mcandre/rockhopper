# BUILDTIME REQUIREMENTS

* a UNIX-like environment (e.g. [WSL](https://learn.microsoft.com/en-us/windows/wsl/))
* [Docker](https://www.docker.com/) 28.0.1+
* POSIX compliant [findutils](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/find.html)
* POSIX compliant [make](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/make.html)

## Recommended

* a host capable of running musl/Linux containers (e.g. a GNU/Linux, musl/Linux, macOS, or Windows host)
* [Docker First Aid Kit](https://github.com/mcandre/docker-first-aid-kit)
* Apply `DOCKER_DEFAULT_PLATFORM` = `linux/amd64` environment variable
* [GNU time](https://www.gnu.org/software/time/)
* [tree](https://en.wikipedia.org/wiki/Tree_(command))

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

# CLEAN

```sh
make clean
```
