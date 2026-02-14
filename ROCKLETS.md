# ROCKLETS

The ROCKLET interface provides a unified framework for developers to generate basic installer packages for a diverse set of distributions.

The stock rockhopper rocklets span fundamental package managers (dpkg, rpm, etc.) in the Linux ecosystem. This design balances portability, with practical needs developing the rockhopper system itself.

For other target platforms, including non-Linux platforms, rockhopper is designed extensibly. We anticipate custom rocklets to account for other targets, and to help keep up with emerging needs.

Note: FreeBSD hosts enable FreeBSD containers, but may break alternative libc Linux containers (musl, uClibC, etc.)

## Easy Mode

In a pinch, copy one of the Dockerfile setups for stock rockhopper images.

This method can quickly derive new rocklets. For example, Fedora -> RHEL.

Note: Some Dockerfiles end with nonroot `USER`s and nonroot `WORKDIR`s. If you need to conduct root operations during image builds, such as installing additional packages, then temporarily resetting these attributes.

## Docker Image

The Docker image is the fundamental unit of package generation.

Docker conveniently abstracts many components which otherwise would require host native, even physical hardware to access.

## Behavior

Rocklets mount the current working directory as `ROCKHOPPER_MOUNT`, which defaults to `/mnt/rockhopper` when not overriden by the end user.

Rocklets read assets from `ROCKHOPPER_DATA`, which defaults to `/mnt/rockhopper/rockhopper-data`, when not overridden by the end user.

Rocklets validate package configuration, such as missing or blank variables.

Rocklets terminate nonzero in the event of an error.

Rocklets write packages to a `ROCKHOPPER_ARTIFACT` directory.

Select a unique, short, intuitive `<distro>` name to represent the kind of packages that your rocklet generates.

`ROCKHOPPER_ARTIFACT` defaults to `"${ROCKHOPPER_MOUNT}/.rockhopper/<distro>`, when not overridden by the end user.

Create `ROCKHOPPER_ARTIFACT` idempotently (e.g. `mkdir -p "$ROCKHOPPER_ARTIFACT"`).

## Templates

rocklets may use [Jinja](https://jinja.palletsprojects.com/en/stable/) format template files, in order to wire together user settings with the configuration files that control package builds.

rocklets read template files from a `ROCKHOPPER_SPECS` directory, default `$HOME/rockhopper-specs`.

### Warning

Regarding the `.rockhopper` directory tree, do not touch file paths outside of that rocklet's specific `<distro>`. Doing so risks systemic breakage.

## Configuration

Configuration for a rocklet uses some combination of the following mechanisms:

* Environment variables documented in [CONFIGURATION.md](CONFIGURATION.md)
* Environment variable conventions used by stock rockhopper [docker](docker) images
* New environment variables with a `ROCKHOPPER_` prefix
* Files loaded through `ROCKHOPPER_MOUNT`
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

Stubs welcome.
