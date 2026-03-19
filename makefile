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
	install \
	lint \
	publish \
	rustfmt \
	test \
	test-go \
	test-rust \
	test-shell \
	uninstall \
	upload
.IGNORE: \
	clean \
	clean-cargo \
	clean-example

VERSION!=cargo metadata --format-version 1 --no-deps | jq -r ".packages[0].version"

all: install

build: lint
	cargo build --release

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

install:
	cargo install --force --path .

lint: \
	cargo-check \
	clippy \
	doc \
	rustfmt

publish:
	cargo publish

rustfmt:
	cargo fmt

test: test-go test-rust test-shell

test-go:
	sh -c "cd examples/go && rockhopper && tree .rockhopper/artifacts"

test-rust:
	sh -c "cd examples/rust && rockhopper && tree .rockhopper/artifacts"

test-shell:
	sh -c "cd examples/shell && rockhopper && tree .rockhopper/artifacts"

uninstall:
	cargo uninstall rockhopper
