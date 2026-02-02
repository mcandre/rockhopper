# INSTALL

## Requirements

* [Docker](https://www.docker.com/) 28.0.1+

## Recommended

* a UNIX-like environment (e.g. [WSL](https://learn.microsoft.com/en-us/windows/wsl/))
* a host capable of running musl/Linux containers (e.g. a GNU/Linux, musl/Linux, macOS, or Windows host)
* [Docker First Aid Kit](https://github.com/mcandre/docker-first-aid-kit)
* Apply `DOCKER_DEFAULT_PLATFORM` = `linux/amd64` environment variable
* [GNU time](https://www.gnu.org/software/time/)
* [tree](https://en.wikipedia.org/wiki/Tree_(command))

## Instructions

```sh
docker pull n4jm4/rockhopper:alpine
docker pull n4jm4/rockhopper:arch
docker pull n4jm4/rockhopper:debian
docker pull n4jm4/rockhopper:rhel
docker pull n4jm4/rockhopper:slack
```

For more information on developing buttery itself, see [DEVELOPMENT.md](DEVELOPMENT.md).
