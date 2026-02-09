# CONFIGURATION

# FLAGS

## `--debug`, `-d`

Overrides `ROCKHOPPER_LOG_LEVEL`.

Enables debug mode. Show additional logs.

In the event a problem, debug mode provides context for common resources, such as package configurations.

## `--quiet`, `-q`

Overrides `ROCKHOPPER_LOG_LEVEL`.

Enables quiet mode. Elide most console logs.

In the event of a problem, remove this option.

## `--help`, `-h`

Show usage menu.

## `--version`, `-V`

Show version banner.

## `-- [<ROCKLET OPTIONS>]`

Forward `<ROCKLET OPTIONS>` from `rockhopper` to individual `rocklet` containers.

# ENVIRONMENT VARIABLES

rockhopper uses environment variables as the primary configuration mechanism.

## `ROCKHOPPER_LOG_LEVEL`

Default: `info`

Optional.

When `info`, propagate logs from package building commands.

When `quiet`, enables quiet mode.

When `debug`, enables debug mode.

See also `--quiet, -q`, `--debug, -d`.

## `ROCKHOPPER_IMAGE`

Required, nonblank.

A Docker image implementing the [ROCKLET](ROCKLETS.md) interface for package generation.

Example: `"n4jm4/rockhopper:debian"`

## `ROCKHOPPER_DATA`

Default: `"/mnt/rockhopper/rockhopper-data"`

Optional.

A directory path relative to `ROCKHOPPER_MOUNT`, which lays out application files according to the [Filesystem Hierarchy Standard](https://specifications.freedesktop.org/fhs/latest/).

## `ROCKHOPPER_SPECS`

Default: `"$HOME/rockhopper-specs"`

Optional.

A directory containing package configuration [Jinja](https://jinja.palletsprojects.com/en/stable/) templates.

## `ROCKHOPPER_NAME`

Required, nonblank.

A unique, memorable name for a package.

Example: `"hello"`

Search databases for any existing names:

* https://linux.die.net/
* https://man.freebsd.org/cgi/man.cgi
* https://pkgs.org/
* https://brew.sh/
* https://hub.docker.com/
* https://github.com/
* https://snapcraft.io/
* https://launchpad.net/ubuntu/+ppas
* https://ss64.com/mac/
* https://chocolatey.org/
* https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands

## `ROCKHOPPER_VERSION`

Required, nonblank.

A release version for a package.

Example: `"1.0.0"`

[SemVer](https://semver.org/)

## `ROCKHOPPER_ARCH`

Required, nonblank.

Target architecture.

Syntax relative to distribution.

Examples:

* `"i386"` (Debian 32-bit Intel/AMD)
* `"i686"` (RHEL 32-bit Intel/AMD)
* `"all"` (Debian, architecture independent)
* `"noarch"` (RHEL, architecture independent)

## `ROCKHOPPER_REV`

Commonly required, relative to distribution.

A revision increment, for patches between upstream versions.

Example: `"1"`

## `ROCKHOPPER_MAINTAINER`

Commonly required, relative to distribution.

Email contact information for a package maintainer. RFC882 format.

Example: `"Bob Loblaw <bob@bananastand.test>"`

## `ROCKHOPPER_DEPENDENCIES`

Optional.

Prerequisite package constraints.

Syntax relative to distribution.

Example: `"curl"`

## `ROCKHOPPER_SUMMARY`

Commonly required, relative to distribution.

A terse explanation of a package.

Example: `"greeter"`

## `ROCKHOPPER_DESCRIPTION`

Commonly required, relative to distribution.

A brief explanation of a package.

Example: `"hello world welcomes new developers"`

## `ROCKHOPPER_COPYRIGHT`

Recommended.

A copyright notice of ownership.

Example: `"Copyright (C) 2026 Bob"`

## `ROCKHOPPER_LICENSE`

Commonly required, relative to distribution.

Recommended.

Commonly [SPDX](https://spdx.org/licenses/), though syntax often relative to distribution.

Example: `"0BSD"`

## `ROCKHOPPER_CHANGELOG`

Required for RHEL family distributions.

File path of a changelog document. Path is relative to a `rockhopper-data` root directory.

Syntax relative to distribution. See [Fedora Manual Changelog](https://docs.fedoraproject.org/en-US/packaging-guidelines/manual-changelog/).

Example: `"CHANGELOG.txt"`

## `ROCKHOPPER_URL`

Commonly required, relative to distribution.

A homepage for a package.

Example: `"https://bobslawblog.test/"`

## `ROCKHOPPER_MOUNT`

Default: `/mnt/rockhopper`

Optional.

Customize the directory used to copy assets from the host environment into rocklet containers.

## Other

Individual distribution images may require additional parameters.
