# INSTALL

## Requirements

* [bash](https://www.gnu.org/software/bash/) 4+
* [Docker](https://www.docker.com/) 28.0.1+
* GNU [grep](https://www.gnu.org/software/grep/)

## Recommended

* a UNIX-like environment (e.g. [WSL](https://learn.microsoft.com/en-us/windows/wsl/))
* a host capable of running musl/Linux containers (e.g. a GNU/Linux, musl/Linux, macOS, or Windows host)
* [Docker First Aid Kit](https://github.com/mcandre/docker-first-aid-kit)
* Apply `DOCKER_DEFAULT_PLATFORM` = `linux/amd64` environment variable
* [GNU time](https://www.gnu.org/software/time/)
* [tree](https://en.wikipedia.org/wiki/Tree_(command))

## Instructions

1. Clone the project to a local directory.

```console
$ git clone https://github.com/mcandre/rockhopper.git "$HOME/rockhopper"
```

2. Add .../rockhopper/bin to `PATH`.

For example, `$HOME/.bashrc` (bash):

```sh
export PATH="$PATH:$HOME/rockhopper/bin"
```

For more information on developing rockhopper itself, see [DEVELOPMENT.md](DEVELOPMENT.md).
