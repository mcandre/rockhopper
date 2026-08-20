.POSIX:
.SILENT:
.PHONY: \
	all \
	audit \
	build \
	cargo-check \
	clean \
	clean-cargo \
	clean-examples \
	clean-go \
	clean-rust \
	clean-shell \
	clippy \
	doc \
	docker-build \
	docker-push \
	docker-test \
	govulncheck \
	install \
	itest \
	itest-go \
	itest-rust \
	itest-shell \
	lint \
	publish \
	rustfmt \
	shellcheck \
	test \
	uninstall
.IGNORE: \
	clean \
	clean-cargo \
	clean-example

VERSION!=cargo metadata --format-version 1 --no-deps | jq -r ".packages[0].version"

all: build

audit: cargo-audit govulncheck

build:
	cargo build --release

cargo-audit:
	cargo audit

cargo-check:
	cargo check

clean: clean-cargo clean-examples

clean-cargo:
	cargo clean

clean-examples: clean-go clean-shell

clean-go:
	sh -c "cd examples/go && rockhopper -c"

clean-rust:
	sh -c "cd examples/rust && rockhopper -c"

clean-shell:
	sh -c "cd examples/shell && rockhopper -c"

clippy:
	cargo clippy

doc:
	cargo doc

docker-build:
	docker buildx bake all --var "VERSION=$(VERSION)"

docker-push:
	docker buildx bake production --var "VERSION=$(VERSION)" --push

docker-test:
	docker buildx bake test --var "VERSION=$(VERSION)" --push

govulncheck:
	govulncheck -scan package ./...

install:
	cargo install --force --path .

itest: itest-go itest-rust itest-shell

itest-go:
	sh -c "cd examples/go && rockhopper && tree .rockhopper/artifacts"

itest-rust:
	sh -c "cd examples/rust && rockhopper && tree .rockhopper/artifacts"

itest-shell:
	sh -c "cd examples/shell && rockhopper && tree .rockhopper/artifacts"

lint: \
	cargo-check \
	clippy \
	doc \
	rustfmt \
	shellcheck

publish:
	cargo publish

rustfmt:
	cargo fmt

shellcheck:
	stank -print0 . | \
		xargs -0 -n 1 shellcheck

test:
	cargo test

uninstall:
	cargo uninstall rockhopper
