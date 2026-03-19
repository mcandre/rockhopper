.POSIX:
.SILENT:
.PHONY: \
	all \
	audit \
	build \
	cargo-check \
	clean \
	clean-cargo \
	clean-crit \
	clean-examples \
	clean-go \
	clean-packages \
	clean-rust \
	clean-shell \
	clippy \
	crit \
	doc \
	docker-build \
	docker-push \
	docker-test \
	install \
	lint \
	package \
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
	clean-crit \
	clean-example \
	clean-packages

VERSION!=cargo metadata --format-version 1 --no-deps | jq -r ".packages[0].version"
BANNER=rockhopper

all: install

build: lint
	cargo build --release

cargo-check:
	cargo check

clean: clean-cargo clean-crit clean-examples clean-packages

clean-cargo:
	cargo clean

clean-crit:
	crit -c

clean-examples: clean-go clean-shell

clean-go:
	sh -c "cd examples/go && rockhopper -c"

clean-packages:
	rockhopper -c

clean-rust:
	sh -c "cd examples/rust && rockhopper -c"

clean-shell:
	sh -c "cd examples/shell && rockhopper -c"

clippy:
	cargo clippy

crit:
	crit -b $(BANNER)

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

package:
	rockhopper -r "version=$(VERSION)"

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

upload:
	./upload
