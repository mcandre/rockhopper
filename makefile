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
	clean-packages \
	clean-ports \
	clean-rust \
	clean-shell \
	clippy \
	crit \
	doc \
	docker-build
	docker-push
	docker-test
	install \
	lint \
	package \
	port \
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
	clean-example \
	clean-packages \
	clean-ports

VERSION!=cargo metadata --format-version 1 --no-deps | jq -r ".packages[0].version"
BANNER=rockhopper-$(VERSION)

all: install

build: lint
	cargo build --release

cargo-check:
	cargo check

clean: clean-cargo clean-examples clean-packages clean-ports

clean-cargo:
	cargo clean

clean-examples: clean-go clean-shell

clean-go:
	rm -rf examples/go/.rockhopper

clean-packages:
	rm -rf .rockhopper

clean-ports:
	crit -c

clean-rust:
	rm -rf examples/rust/.rockhopper

clean-shell:
	rm -rf examples/shell/.rockhopper

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
	rockhopper

port:
	./port -C .crit/bin -a rockhopper $(BANNER)

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
