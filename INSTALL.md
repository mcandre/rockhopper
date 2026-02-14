# INSTALL GUIDE

In addition to individual Docker images, rockhopper also supports alternative installation methods.

# INSTALL (CURL)

```sh
curl -L https://raw.githubusercontent.com/mcandre/rockhopper/refs/heads/main/install-rockhopper | sh
```

## Postinstall

Ensure `$HOME/.local/bin` is registered with your shell's `PATH` environment variable.

## Uninstall

```sh
curl -L https://raw.githubusercontent.com/mcandre/rockhopper/refs/heads/main/uninstall-rockhopper | sh
```

## System Requirements

Supported host environments:

* Linux
* macOS
* UNIX
* Windows via [WSL](https://learn.microsoft.com/en-us/windows/wsl/)

Prerequisites:

* [bash](https://www.gnu.org/software/bash/) 4+
* [curl](https://curl.se/)

# INSTALL (HOST OS PACKAGE)

We post OS packages for rockhopper itself.

## Warning

Packages are currently posted to a rate limited, non-CDN, CloudFlare R2 bucket. This may periodically interrupt local automation or remote CI/CD pipelines.

Before weaving rockhopper host OS packages into automation, copy packages to a suitable caching proxy, such as nginx, squid, Artifactory, Nexus, AWS S3, etc.

## Install Media

| Host Distro Family | Package |
| ------------- | ------- |
| Alpine Linux | [rockhopper-0.0.9-r1.noarch.apk](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.9/alpine-linux/rockhopper-0.0.9-r1.noarch.apk) |
| Arch Linux | [rockhopper-0.0.9-1-any.pkg.tar.zst](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.9/arch-linux/rockhopper-0.0.9-1-any.pkg.tar.zst) |
| CRUX | [rockhopper#0.0.9-1.pkg.tar.gz](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.9/crux-x86_64/rockhopper%230.0.9-1.pkg.tar.gz) |
| Debian | [rockhopper_0.0.9-1_all.deb](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.9/debian/rockhopper_0.0.9-1_all.deb) |
| Fedora | [rockhopper-0.0.9-1.noarch.rpm](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.9/fedora/rockhopper-0.0.9-1.noarch.rpm) |
| Slackware Linux | [rockhopper-0.0.9-1-noarch-build.tgz](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.9/slackware-linux/rockhopper-0.0.9-1-noarch-build.tgz) |
| Ubuntu / Windows (WSL) | [rockhopper_0.0.9-1_all.deb](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.9/ubuntu/rockhopper_0.0.9-1_all.deb) |
| Void Linux (musl) | [rockhopper-0.0.9_1.x86_64.xbps](https://pub-07ac5f2bd61240e19fa59ab1c0327d7b.r2.dev/rockhopper-0.0.9/void-linux-musl/rockhopper-0.0.9_1.x86_64.xbps) |

# System Requirements

Supported host environments:

* Linux
* Windows via [WSL](https://learn.microsoft.com/en-us/windows/wsl/)
