# INSTALL GUIDE

In addition to OS packages, we also support git cloning.

# INSTALL (GIT)

## Install

```sh
git clone https://github.com/mcandre/rockhopper.git "$HOME/rockhopper"
```

## Postinstall

Ensure the rockhopper `bin` directory is registered with your shell's `PATH` environment variable.

## Uninstall

```sh
rm -rf "$HOME/rockhopper"
```

## System Requirements

Supported host environments:

* Linux
* macOS
* Other UNIX-like environments with access to the `docker` CLI
* Windows native† or [WSL](https://learn.microsoft.com/en-us/windows/wsl/)

Prerequisites:

* [Docker](https://www.docker.com/) 28.0.1+
* [git](https://git-scm.com/)

† Windows native users may invoke individual rockhopper images with `docker run`... commands. Recommend bundling commands together in a custom script (e.g. MS-DOS batch scripts).
