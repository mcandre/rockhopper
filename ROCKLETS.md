# ROCKLETS

The ROCKLET interface provides a unified framework for developers to generate basic installer packages for a diverse set of distributions.

## Docker Image

The Docker image is the fundamental unit of package generation.

Docker conveniently abstracts many components which otherwise would require host native, even physical hardware to access.

## Behavior

Rocklets mount the current working directory as `ROCKHOPPER_MOUNT`, which defaults to `/mnt/rockhopper` when not overriden by the end user.

Rocklets read assets from `ROCKHOPPER_DATA_DIR`, which defaults to `/mnt/rockhopper/rockhopper-data`, when not overridden by the end user.

Rocklets validate package configuration, such as missing or blank variables.

Rocklets terminate nonzero in the event of an error.

Rocklets write packages to a `ROCKHOPPER_ARTIFACT_DIR` directory.

Select a unique, short, intuitive `<distro>` name to represent the kind of packages that your rocklet generates.

`ROCKHOPPER_ARTIFACT_DIR` defaults to `"${ROCKHOPPER_MOUNT}/.rockhopper/<distro>`, when not overridden by the end user.

Create `ROCKHOPPER_ARTIFACT_DIR` idempotently (e.g. `mkdir -p "$ROCKHOPPER_ARTIFACT_DIR"`).

### Warning

Regarding the `.rockhopper` directory tree, do not touch file paths outside of that rocklet's specific `<distro>`. Doing so risks systemic breakage.

## Configuration

Configuration for a rocklet uses some combination of the following mechanisms:

* Environment variable examples documented in [CONFIGURATION.md](CONFIGURATION.md)
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
