# ROCKLETS

The ROCKLET interface provides a unified framework for developers to generate basic installer packages for a diverse set of distributions.

The stock rockhopper rocklets span common package managers (apk, dpkg, pkg, rpm, etc.) in the software ecosystem. This design balances portability, with practical needs developing the rockhopper system itself.

rockhopper is designed extensibly. We anticipate custom rocklets to account for new and emerging targets, to match the evolving needs of software users.

# EASY MODE

In a pinch, copy one of the Dockerfile setups for [stock](README.md#stock-images) rockhopper images.

This method can quickly derive new rocklets. For example, Fedora -> RHEL, Ubuntu -> Debian, etc.

# DOCKER IMAGE

The Docker image is the fundamental unit of package generation.

Docker conveniently abstracts many components which otherwise would require host native, even physical hardware to access.

# BEHAVIOR

Rocklets mount the current working directory to `$rocklet_mount_path`, default `/mnt/rockhopper`.

Rocklets read assets from `$rocklet_cache/source-media`, default `/mnt/rockhopper/.rockhopper/source-media`.

Rocklets validate package configuration, such as missing or blank variables.

Rocklets terminate nonzero in the event of an error.

Rocklets write packages to a `$rocklet_artifact` directory, default `$rocklet_mount_path/.rockhopper/<distro>`.

Select a unique, short, intuitive `<distro>` name to represent the kind of packages that your rocklet generates.

`rocklet_artifact` defaults to `"/mnt/rockhopper/.rockhopper/<distro>`, when not overridden by the end user.

Create directories like idempotently (e.g. `mkdir -p "$rocklet_artifact"`).

# CONFIGURATION

Configuration for a rocklet uses some combination of the following mechanisms:

* Environment variable conventions used by stock rockhopper [docker](docker) images
* New environment variables with a `rocklet_` prefix
* Files loaded through `/mnt/rockhopper`
* CLI Flags

# ENTRYPOINT

A rocklet registers a Docker `ENTRYPOINT` executable.

The executable has basename `rocklet`.

Reduce nonerror console logs.

# CLI FLAGS

* `--debug`, `-d`: Enable debug mode. Provide more context as package is being built.
* `--quiet`, `-q`: Enable quiet mode. Elide all rocklet console logs from stdout and from stderr, except in the event of an error.
* `--help`, `-h`: Show usage menu.
* `--version`, `-V`: Show a rockhopper compatibility version banner, of the form `<rocklet executable> <rockhopper version>`.

The banner executable indicated may be either basename or absolute path.

The banner may include additional text columns beyond the executable and rockhopper version.

Rocklets may implement new CLI flags.

Rocklets validate CLI flags (`rocklet --nosuchflag` should fail).

# ENVIRONMENT VARIABLES

rocklets use environment variables as the primary configuration mechanism, with a `rocklet_` prefix.

## `rocklet_log_level`

rocklets support both minimal and verbose logging modes.

Default: `info`

When `info`, propagate logs from package building commands.

When `quiet`, enables quiet mode.

When `debug`, enables debug mode.

See also `--quiet, -q`, `--debug, -d`.

# TEMPLATES

rocklets may use [Jinja](https://jinja.palletsprojects.com/en/stable/) format template files, in order to wire together user settings with the configuration files that control package builds.

rocklets read template files from a `$rocklet_templates` directory, default `$HOME/templates`.

## Warning

The Jinja ecosystem has many quirks.

### Environment Variable Syntax

The Jinja specification uses `environ('<name>')` to query environment variables. However, popular Jinja implementations use different syntaxes. rsubst uses `<name>`. Other implementations may use yet other syntaxes, or fail to support environment variable lookup.

### Undefined/Missing/Blank Variable Semantics

Most Jinja implementations silent treat undefined variables as blank strings. rsubst provides a `--strict` flag to catch problems with undefined variables earlier in development.

Depending on the application, some variables are expected to default to blank strings when undefined. The safest, most portable way to do this is to enable strict mode, then apply the pipe style (`|`) Jinja syntax for defaulting to a given value:

```jinja
{{ rocklet_dependencies | default('') }}
```

However, some variables may not have a meaningful default value to choose.

```jinja
{{ rocklet_name }}
```

This problem is complicated by the fact that Jinja implementations may obscure the name of the undefined variable in error messages.

To account for ambiguous templating error messages, and in case of forgetting to enable strict mode in every templating command, be advised to separately validate all required variables and required nonblank variables in rocklets (e.g. shell scripts).

```sh
#!/bin/sh
set -eu

rocklet_name="${rocklet_name:-}"

eval "k=\$$rocklet_name"

if [ -z "$k" ]; then
    echo "error: blank/missing env var: rocklet_name"
    exit 1
fi
```
