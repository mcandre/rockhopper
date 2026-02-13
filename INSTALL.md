# INSTALL GUIDE

In addition to OS packages, we also support git cloning.

# INSTALL (GIT)

## Install

```sh
git clone https://github.com/mcandre/rockhopper.git "$HOME/rockhopper"
```

## Postinstall

Ensure `$HOME/rockhopper/bin` is registered with your shell's `PATH` environment variable.

## Uninstall

```sh
rm -rf "$HOME/rockhopper"
```

## System Requirements

Supported host environments:

* BSD's
* Linux
* macOS
* Windows via [WSL](https://learn.microsoft.com/en-us/windows/wsl/)
* Other UNIX-like environments with access to the `docker` CLI

Prerequisites:

* [Docker](https://www.docker.com/) 28.0.1+
* [git](https://git-scm.com/)
