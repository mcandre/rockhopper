# INSTALL GUIDE

In addition to curl based installs, we also post OS packages for rockhopper itself.

## Warning

Packages are currently posted to a rate limited, non-CDN, CloudFlare R2 bucket.

Before weaving packages into downstream automation, such as CI/CD pipelines, first copy them to a suitable caching proxy. For example, nginx, squid, Artifactory, Nexus, etc.

## INSTALL (OS PACKAGE)

| Distro Family | Package |
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
