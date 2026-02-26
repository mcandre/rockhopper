# ROCKLETS

The ROCKLET interface provides a unified framework for developers to generate basic installer packages for a diverse set of distributions.

The stock rockhopper rocklets span common package managers (apk, dpkg, rpm, etc.) in the Linux ecosystem. This design balances portability, with practical needs developing the rockhopper system itself.

For other target platforms, including non-Linux platforms, rockhopper is designed extensibly. We anticipate custom rocklets to account for other targets, and to help keep up with emerging needs.

Note: FreeBSD hosts enable FreeBSD containers, but may break alternative libc Linux containers (musl, uClibC, etc.)

## Easy Mode

In a pinch, copy one of the Dockerfile setups for [stock](README.md#stock-images) rockhopper images.

This method can quickly derive new rocklets. For example, Fedora -> RHEL, Ubuntu -> Debian, etc.

## Docker Image

The Docker image is the fundamental unit of package generation.

Docker conveniently abstracts many components which otherwise would require host native, even physical hardware to access.

## Behavior

Rocklets mount the current working directory to `$rocklet_mount_path`, default `/mnt/rockhopper`.

Rocklets read assets from `$rocklet_cache/source-media`, default `/mnt/rockhopper/.rockhopper/source-media`.

Rocklets validate package configuration, such as missing or blank variables.

Rocklets terminate nonzero in the event of an error.

Rocklets write packages to a `$rocklet_artifact` directory, default `$rocklet_mount_path/.rockhopper/<distro>`.

Select a unique, short, intuitive `<distro>` name to represent the kind of packages that your rocklet generates.

`rocklet_artifact` defaults to `"/mnt/rockhopper/.rockhopper/<distro>`, when not overridden by the end user.

Create directories like idempotently (e.g. `mkdir -p "$rocklet_artifact"`).

## Templates

rocklets may use [Jinja](https://jinja.palletsprojects.com/en/stable/) format template files, in order to wire together user settings with the configuration files that control package builds.

rocklets read template files from a `$rocklet_specs` directory, default `$HOME/rockhopper-specs`.

### Warning

rsubst silently treats missing/unset/unexported environment variables as blank strings in Jinja templates.

## Configuration

Configuration for a rocklet uses some combination of the following mechanisms:

* Environment variable conventions used by stock rockhopper [docker](docker) images
* New environment variables with a `rocklet_` prefix
* Files loaded through `/mnt/rockhopper`
* CLI Flags

## Entrypoint

A rocklet registers a Docker `ENTRYPOINT` executable.

The executable has basename `rocklet`.

Reduce nonerror console logs.

## CLI Flags

* `--debug`, `-d`: Enable debug mode. Provide more context as package is being built.
* `--quiet`, `-q`: Enable quiet mode. Elide all rocklet console logs from stdout and from stderr, except in the event of an error.
* `--help`, `-h`: Show usage menu.
* `--version`, `-V`: Show a rockhopper compatibility version banner, of the form `<rocklet executable> <rockhopper version>`.

The banner executable indicated may be either basename or absolute path.

The banner may include additional text columns beyond the executable and rockhopper version.

Rocklets may implement new CLI flags.

Rocklets validate CLI flags (`rocklet --nosuchflag` should fail).

## Environment Variables

rocklets use environment variables as the primary configuration mechanism, with a `rocklet_` prefix.

### `rocklet_log_level`

rocklets support both minimal and verbose logging modes.

Default: `info`

When `info`, propagate logs from package building commands.

When `quiet`, enables quiet mode.

When `debug`, enables debug mode.

See also `--quiet, -q`, `--debug, -d`.
