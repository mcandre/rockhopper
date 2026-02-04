# CONFIGURATION

# FLAGS

## `--quiet`, `-q`

Quiet mode. Elide most console logs.

In the event of a problem, remove this option.

## `--debug`, `-d`

Debug mode. Show additional logs.

Cancels quiet mode.

In the event a problem, debug mode provides context for common resources, such as package configurations.

## `--help`, `-h`

Show usage menu.

## `--version`, `-V`

Show version banner.

## `-- [<ROCKLET OPTIONS>]`

Forward `<ROCKLET OPTIONS>` from `rockhopper` to individual `rocklet` containers.

# ENVIRONMENT VARIABLES

rockhopper uses environment variables as the primary configuration mechanism.

## `ROCKHOPPER_QUIET`

Default: `0`

Optional.

When `1`, requests quiet mode.

See also `--quiet, -q`.

## `ROCKHOPPER_DEBUG`

Default: `0`

Optional.

When `1`, disables quiet mode and enables additional logging.

See also `--debug`, `-d`.

## `ROCKHOPPER_IMAGE`

Required, nonblank.

A Docker image implementing the [ROCKLET](ROCKLETS.md) interface for package generation.

Example: `"n4jm4/rockhopper:debian"`

## `ROCKHOPPER_NAME`

Required, nonblank.

A unique, memorable name for a package.

Example: `"hello"`

Search Linux databases for similarly named tools:

* https://linux.die.net/
* https://pkgs.org/

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
