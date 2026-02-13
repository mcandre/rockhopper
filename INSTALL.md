# INSTALL GUIDE

In addition to curl, rockhopper also supports alternative installation methods.

# INSTALL (DOCKER IMAGE)

Rocklet images can run/download on an individual basis.

```sh
docker run -v "<cwd>:/mnt/rockhopper" -e ROCKHOPPER_NAME="hello" -e ROCKHOPPER_VERSION="1.0.0" -e ROCKHOPPER_REV="1" <image>
```

## Rocklet Images

| Target Distro | Image |
| ------------- | ----- |
| Alpine Linux | n4jm4/rockhopper:alpine-linux |
| Arch Linux | n4jm4/rockhopper:arch |
| CRUX | n4jm4/rockhopper:crux |
| Debian | n4jm4/rockhopper:debian |
| Fedora | n4jm4/rockhopper:fedora |
| Slackware Linux | n4jm4/rockhopper:slackware-linux |
| Ubuntu / Windows (WSL) | n4jm4/rockhopper:ubuntu |
| Void Linux (musl) | n4jm4/rockhopper:void-linux-musl |

[Version pin tags](https://hub.docker.com/r/n4jm4/rockhopper/tags) also available, of the form:

`n4jm4/rockhopper:<rockhopper version>-<distro>`

Pro tip: A happy consequence of building Ubuntu packages, is that Windows users can then access your applications via [WSL](https://learn.microsoft.com/en-us/windows/wsl/).

For information on developing custom rockhopper package generators, see the [rocklets interface](ROCKLETS.md).

## System Requirements

Supported host environments:

* BSD's
* Linux
* macOS
* Windows native or [WSL](https://learn.microsoft.com/en-us/windows/wsl/)
* Other UNIX-like environments with access to the `docker` CLI

Prerequisites:

* a [docker](https://www.docker.com/) CLI

# INSTALL (HOST OS PACKAGE)

We post OS packages for rockhopper itself.

## Warning

Packages are currently posted to a rate limited, non-CDN, CloudFlare R2 bucket.

Copy packages to a suitable caching proxy, before weaving them into downstream automated processes like CI/CD pipelines.

| Host Distro Family | Package |
| ------------- | ------- |
| Alpine Linux | [rockhopper-0.0.8-r1.noarch.apk](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.8/alpine-linux/rockhopper-0.0.8-r1.noarch.apk) |
| Arch Linux | [rockhopper-0.0.8-1-any.pkg.tar.zst](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.8/arch-linux/rockhopper-0.0.8-1-any.pkg.tar.zst) |
| CRUX | [rockhopper#0.0.8-1.pkg.tar.gz](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.8/crux-x86_64/rockhopper%230.0.8-1.pkg.tar.gz) |
| Debian | [rockhopper_0.0.8-1_all.deb](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.8/debian/rockhopper_0.0.8-1_all.deb) |
| Fedora | [rockhopper-0.0.8-1.noarch.rpm](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.8/fedora/rockhopper-0.0.8-1.noarch.rpm) |
| Slackware Linux | [rockhopper-0.0.8-1-noarch-build.tgz](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.8/slackware-linux/rockhopper-0.0.8-1-noarch-build.tgz) |
| Ubuntu / Windows (WSL) | [rockhopper_0.0.8-1_all.deb](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.8/ubuntu/rockhopper_0.0.8-1_all.deb) |
| Void Linux (musl) | [rockhopper-0.0.8_1.noarch.xbps](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.8/void-linux/rockhopper-0.0.8_1.noarch.xbps) |

# System Requirements

Supported host environments:

* Linux
* Windows via [WSL](https://learn.microsoft.com/en-us/windows/wsl/)

Prerequisites:

* a [docker](https://www.docker.com/) CLI

We decouple Docker from formal OS package dependencies. This allows more flexibility in terms of container runtimes.
