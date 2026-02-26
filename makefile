.POSIX:
.SILENT:
.PHONY: \
	all \
	audit \
	build \
	cargo-check \
	clean \
	clean-cargo \
	clean-example \
	clean-packages \
	clean-ports \
	clippy \
	crit \
	doc \
	docker-build \
	docker-build-alpine-linux \
	docker-build-fedora \
	docker-build-ubuntu \
	docker-push \
	docker-push-alpine-linux \
	docker-push-fedora \
	docker-push-ubuntu \
	docker-test \
	docker-test-alpine-linux \
	docker-test-fedora \
	docker-test-ubuntu \
	install \
	lint \
	package \
	port \
	publish \
	rustfmt \
	test \
	uninstall \
	upload
.IGNORE: \
	clean \
	clean-cargo \
	clean-example \
	clean-packages \
	clean-ports

VERSION=0.0.14
BANNER=rockhopper-$(VERSION)

all: docker-build

build: lint
	cargo build --release

cargo-check:
	cargo check

clean: clean-cargo clean-example clean-packages clean-ports

clean-cargo:
	cargo clean

clean-example:
	rm -rf example/sh/.rockhopper

clean-packages:
	rm -rf /tmp/rockhopper

clean-ports:
	crit -c

clippy:
	cargo clippy

crit:
	crit -b $(BANNER)

doc:
	cargo doc

docker-build: \
	docker-build-alpine-linux \
	docker-build-fedora \
	docker-build-ubuntu

docker-build-alpine-linux:
	sh -c "cd docker/alpine-linux && tuggy -t n4jm4/rockhopper:alpine-linux --load"

docker-build-fedora:
	sh -c "cd docker/fedora && tuggy -t n4jm4/rockhopper:fedora --load"

docker-build-ubuntu:
	sh -c "cd docker/ubuntu && tuggy -t n4jm4/rockhopper:ubuntu --load"

docker-push: \
	docker-push-alpine-linux \
	docker-push-fedora \
	docker-push-ubuntu

docker-push-alpine-linux:
	sh -c "cd docker/alpine-linux && tuggy -t n4jm4/rockhopper:alpine-linux -a n4jm4/rockhopper:$(VERSION)-alpine-linux-3.23,n4jm4/rockhopper:$(VERSION)-alpine-linux,n4jm4/rockhopper:alpine-linux-3.23 --push"

docker-push-fedora:
	sh -c "cd docker/fedora && tuggy -t n4jm4/rockhopper:fedora -a n4jm4/rockhopper:$(VERSION)-fedora-43,n4jm4/rockhopper:$(VERSION)-fedora,n4jm4/rockhopper:fedora-43 --push"

docker-push-ubuntu:
	sh -c "cd docker/ubuntu && tuggy -t n4jm4/rockhopper:ubuntu -a n4jm4/rockhopper:$(VERSION)-ubuntu-24.04,n4jm4/rockhopper:$(VERSION)-ubuntu-noble,n4jm4/rockhopper:$(VERSION)-ubuntu,n4jm4/rockhopper:ubuntu-24.04,n4jm4/rockhopper:ubuntu-noble --push"

docker-test: \
	docker-test-alpine-linux \
	docker-test-fedora \
	docker-test-ubuntu

docker-test-alpine-linux:
	sh -c "cd docker/alpine-linux && tuggy -t n4jm4/rockhopper:test-alpine-linux --load"
	sh -c "cd docker/alpine-linux && tuggy -t n4jm4/rockhopper:test-alpine-linux --push"

docker-test-fedora:
	sh -c "cd docker/fedora && tuggy -t n4jm4/rockhopper:test-fedora --load"
	sh -c "cd docker/fedora && tuggy -t n4jm4/rockhopper:test-fedora --push"

docker-test-ubuntu:
	sh -c "cd docker/ubuntu && tuggy -t n4jm4/rockhopper:test-ubuntu --load"
	sh -c "cd docker/ubuntu && tuggy -t n4jm4/rockhopper:test-ubuntu --push"

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

test:
	sh -c "cd example/sh && rockhopper && tree .rockhopper/artifacts"

uninstall:
	cargo uninstall rockhopper

upload:
	./upload
