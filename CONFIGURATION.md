# CONFIGURATION GUIDE

# FLAGS

## `--debug`, `-d`

Overrides `log_level`.

Enables debug mode. Show additional logs.

In the event a problem, debug mode provides context for common resources, such as package configurations.

## `--quiet`, `-q`

Overrides `log_level`.

Enables quiet mode. Elide most console logs.

In the event of a problem, remove this option.

## `--help`, `-h`

Show usage menu.

## `--version`, `-V`

Show version banner.

## `-- [<ROCKLET OPTIONS>]`

Forward `<ROCKLET OPTIONS>` from `rockhopper` to individual [rocklet](ROCKLETS.md) containers.

See `rockhopper -h` for more detail.

# TOML

rockhopper looks for a configuration file `rockhopper.toml` in the current working directory.

## `log_level`

Default: `info`

Also accepts `quiet` (less logs) or `debug` (more logs).

Example:

```toml
log_level = "debug"
```

## `docker_args`

Default: (empty)

Supply additional CLI arguments to `docker run`... commands.

Example:

```toml
docker_args = ["--privilieged"]
```

## `rocklet`

Required fields vary by distribution.

Package attribute table.

Example:

```toml
[rocklet]
name = "raygun"
version = "1.2.3"
```

### `name`

Nonblank.

Commonly required across package managers.

Example:

```toml
[rocklet]
name = "raygun"
```

### `version`

Commonly required across package managers.

Example:

```toml
[rocklet]
name = "raygun"
version = "1.2.3"
```

### `rev`

Often required by package managers.

Release increment, relative to an upstream `version`.

Example:

```toml
[rocklet]
name = "raygun"
version = "1.2.3"
rev = "81"
```

### `maintainer`

Often required by package managers.

Contact information for developer managing packages.

Format: RFC822.

Example:

```toml
[rocklet]
name = "raygun"
maintainer = "Marvin the Martian <marvin@mars.test>"
```

### `summary`

Often required by package managers.

A concise description of the package.

Example:

```toml
[rocklet]
name = "raygun"
summary = "Space modulator"
```

### `description`

Often required by package managers.

A brief description of the package.

Example:

```toml
[rocklet]
name = "raygun"
description = "Illudium Q-36 explosive space modulator"
```

### `copyright`

Generally recommended.

A Copyright identifier.

Example:

```toml
[rocklet]
name = "raygun"
copyright = "Copyright (C) 1948 Marvin the Martian"
```

### `license`

Often required by package managers.

A concise software license identifier. Format: [SPDX](https://spdx.org/licenses/).

Example:

```toml
[rocklet]
name = "raygun"
license = "0BSD"
```

Operating systems often have separate conventions to manage longer license documentation.

### `url`

Often required by package managers.

Software homepage.

Example:

```toml
[rocklet]
url = "https://mars.test/"
```

### `mount_path`

Default: `/mnt/rockhopper`

Customize the location of the container directory where the host current working directory loads.

Example:

```toml
[rocklet]
mount_path = "/mnt/source-media"
```

### `specs`

Template specification directory.

Default: `<container-home>/rockhopper-specs`

Relative to mount path.

Example:

```toml
[rocklet]
mount_path = "/mnt/rockhopper"
specs = "/mnt/rockhopper/templates"
```

### `cache`

Artifact directory root.

Default: `/mnt/rockhopper/.rockhopper`

Relative to mount path.

Example:

```toml
[rocklet]
mount_path = "/mnt/rockhopper"
cache = "/mnt/rockhopper/install-media"
```

## `dest`

Optional.

Map of destination file path to source media file path.

Destination file path relative to `<rocklet-cache>/source-media`.

Default: (empty)

Example:

```toml
[dest]
"usr/bin" = "bin"
"etc/nginx/nginx.conf" = "nginx.conf"
# ...
```

Recommended for binary based package builds.

## `docker_env`

Optional.

Additional Docker environment variables.

Default: (empty)

Example:

```toml
[docker_env]
APPLES = "1"
BANANAS = "2"
CARROTS = "3"
# ...
```

## `pkg`

An array of package specifications.

Default: (empty)

Example:

```toml
[[pkg]]
image = "n4jm4/rockhopper:alpine-linux"

[[pkg]]
image = "n4jm4/rockhopper:fedora"

[[pkg]]
image = "n4jm4/rockhopper:ubuntu"

# ...
```

### `image`

Required, nonblank.

Docker image tag.

Example:

```toml
image = "n4jm4/rockhopper:ubuntu
```

### `rocklet`

Default: (empty)

Per-package attribute table.

Overrides the global rocklet attribute table.

Example:

```toml
[[pkg]]
image = "n4jm4/rockhopper:ubuntu"
rocklet.oci_arch = "linux/amd64"
rocklet.os_arch = "amd64"
rocklet.dependencies = "bash"
# ...
```

#### `oci_arch`

Default: (`DOCKER_DEFAULT_PLATFORM` environment variable)

Package Docker buildx architecture.

Example:

```toml
[[pkg]]
image = "n4jm4/rockhopper:ubuntu"
rocklet.oci_arch = "linux/amd64"
```

Note: `oci_arch` often uses different syntax (buildx) than `os_arch` (distro relative).

Pro tip: Crosscompilation toolchains enable more flexibility for `oci_arch`.

#### `os_arch`

Nonblank.

Default: `<image-architecture>`

OS target architecture identifier. Syntax relative to package manager.

Example:

```toml
[[pkg]]
image = "n4jm4/rockhopper:ubuntu"
rocklet.os_arch = "amd64"
```

##### Prominent OS Architectures

| OS           | ISA                   | Identifier |
| ------------ | --------------------- | ---------- |
| Alpine Linux | 64-bit ARM            | aarch64    |
| Alpine Linux | 64-bit Intel          | x86_64     |
| Alpine Linux | (chipset independent) | noarch     |
| Fedora       | 64-bit ARM            | aarch64    |
| Fedora       | 64-bit Intel          | x86_64     |
| Fedora       | (chipset indepdendet) | noarch     |
| Ubuntu       | 64-bit ARM            | arm64      |
| Ubuntu       | 64-bit Intel          | amd64      |
| Ubuntu       | (chipset independent) | all        |

#### `dependencies`

Default: (empty)

Commonly required for applications large and small.

Syntax may vary by distro.

Example:

```toml
[[pkg]]
image = "n4jm4/rockhopper:ubuntu"
rocklet.dependencies = "bash"
```

#### `artifact`

Package output directory root.

Default: `/mnt/rockhopper/.rockhopper/artifacts/<distro>`

Example:

```toml
[[pkg]]
image = "n4jm4/rockhopper:ubuntu"
rocklet.artifact = "/mnt/rockhopper/.rockhopper/artifacts/webuntu"
```

### `dest`

Optional.

Override global rocklet dest file path map.

Default: (empty)

Example:

```toml
[[pkg]]
image = "n4jm4/rockhopper:ubuntu"
rocklet.oci_arch = "linux/amd64"
dest."usr/bin/raygun" = "bin/x86_64-unknown-linux-musl/raygun"
```

Recommended for binary based package builds.
