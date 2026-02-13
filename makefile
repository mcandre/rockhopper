.POSIX:
.SILENT:
.PHONY: \
	all \
	docker-build \
	docker-build-alpine-linux \
	docker-build-arch-linux \
	docker-build-crux \
	docker-build-debian \
	docker-build-fedora \
	docker-build-slackware-linux \
	docker-build-ubuntu \
	docker-build-void-linux-musl \
	docker-push \
	docker-tag \
	docker-tag-alpine-linux \
	docker-tag-arch-linux \
	docker-tag-crux \
	docker-tag-debian \
	docker-tag-fedora \
	docker-tag-slackware-linux \
	docker-tag-ubuntu \
	docker-tag-void-linux-musl \
	test
.IGNORE: \
	clean

VERSION=0.0.8

all: docker-build

clean:
	rm -rf examples/sh/.rockhopper

docker-build: \
	docker-build-alpine-linux \
	docker-build-arch-linux \
	docker-build-crux \
	docker-build-debian \
	docker-build-fedora \
	docker-build-slackware-linux \
	docker-build-ubuntu \
	docker-build-void-linux-musl

docker-build-alpine-linux:
	sh -c "cd docker/alpine-linux && docker build -t n4jm4/rockhopper:alpine-linux . --load"

docker-build-arch-linux:
	sh -c "cd docker/arch-linux && docker build -t n4jm4/rockhopper:arch-linux . --load"

docker-build-crux:
	sh -c "cd docker/crux && docker build -t n4jm4/rockhopper:crux . --load"

docker-build-debian:
	sh -c "cd docker/debian && docker build -t n4jm4/rockhopper:debian . --load"

docker-build-fedora:
	sh -c "cd docker/fedora && docker build -t n4jm4/rockhopper:fedora . --load"

docker-build-slackware-linux:
	sh -c "cd docker/slackware-linux && docker build -t n4jm4/rockhopper:slackware-linux . --load"

docker-build-ubuntu:
	sh -c "cd docker/ubuntu && docker build -t n4jm4/rockhopper:ubuntu . --load"

docker-build-void-linux-musl:
	sh -c "cd docker/void-linux-musl && docker build -t n4jm4/rockhopper:void-linux-musl . --load"

docker-clean-tags:
	docker images 2>/dev/null | \
		grep '^n4jm4/rockhopper' | \
		awk '{print $$1 }' | \
		xargs -n 1 docker rmi -f

docker-push: docker-clean-tags docker-build docker-tag
	docker push n4jm4/rockhopper --all-tags

docker-tag: \
	docker-tag-alpine-linux \
	docker-tag-arch-linux \
	docker-tag-crux \
	docker-tag-debian \
	docker-tag-fedora \
	docker-tag-slackware-linux \
	docker-tag-ubuntu \
	docker-tag-void-linux-musl

docker-tag-alpine-linux:
	docker tag n4jm4/rockhopper:alpine-linux n4jm4/rockhopper:$(VERSION)-alpine-linux3.23
	docker tag n4jm4/rockhopper:alpine-linux n4jm4/rockhopper:$(VERSION)-alpine-linux3
	docker tag n4jm4/rockhopper:alpine-linux n4jm4/rockhopper:$(VERSION)-alpine-linux
	docker tag n4jm4/rockhopper:alpine-linux n4jm4/rockhopper:alpine-linux3.23
	docker tag n4jm4/rockhopper:alpine-linux n4jm4/rockhopper:alpine-linux3

docker-tag-arch-linux:
	docker tag n4jm4/rockhopper:arch-linux n4jm4/rockhopper:$(VERSION)-arch-linux

docker-tag-crux:
	docker tag n4jm4/rockhopper:crux n4jm4/rockhopper:$(VERSION)-crux3.8
	docker tag n4jm4/rockhopper:crux n4jm4/rockhopper:$(VERSION)-crux3
	docker tag n4jm4/rockhopper:crux n4jm4/rockhopper:$(VERSION)-crux
	docker tag n4jm4/rockhopper:crux n4jm4/rockhopper:crux3.8
	docker tag n4jm4/rockhopper:crux n4jm4/rockhopper:crux3

docker-tag-debian:
	docker tag n4jm4/rockhopper:debian n4jm4/rockhopper:$(VERSION)-trixie
	docker tag n4jm4/rockhopper:debian n4jm4/rockhopper:$(VERSION)-debian13
	docker tag n4jm4/rockhopper:debian n4jm4/rockhopper:$(VERSION)-debian
	docker tag n4jm4/rockhopper:debian n4jm4/rockhopper:trixie
	docker tag n4jm4/rockhopper:debian n4jm4/rockhopper:debian13

docker-tag-fedora:
	docker tag n4jm4/rockhopper:fedora n4jm4/rockhopper:$(VERSION)-fedora43
	docker tag n4jm4/rockhopper:fedora n4jm4/rockhopper:$(VERSION)-fedora
	docker tag n4jm4/rockhopper:fedora n4jm4/rockhopper:fedora43

docker-tag-slackware-linux:
	docker tag n4jm4/rockhopper:slackware-linux n4jm4/rockhopper:$(VERSION)-slackware-linux15.0
	docker tag n4jm4/rockhopper:slackware-linux n4jm4/rockhopper:$(VERSION)-slackware-linux15
	docker tag n4jm4/rockhopper:slackware-linux n4jm4/rockhopper:$(VERSION)-slackware-linux
	docker tag n4jm4/rockhopper:slackware-linux n4jm4/rockhopper:slackware-linux15.0
	docker tag n4jm4/rockhopper:slackware-linux n4jm4/rockhopper:slackware-linux15

docker-tag-ubuntu:
	docker tag n4jm4/rockhopper:ubuntu n4jm4/rockhopper:$(VERSION)-noble
	docker tag n4jm4/rockhopper:ubuntu n4jm4/rockhopper:$(VERSION)-ubuntu24.04
	docker tag n4jm4/rockhopper:ubuntu n4jm4/rockhopper:$(VERSION)-ubuntu24
	docker tag n4jm4/rockhopper:ubuntu n4jm4/rockhopper:$(VERSION)-ubuntu
	docker tag n4jm4/rockhopper:ubuntu n4jm4/rockhopper:noble
	docker tag n4jm4/rockhopper:ubuntu n4jm4/rockhopper:ubuntu24.04
	docker tag n4jm4/rockhopper:ubuntu n4jm4/rockhopper:ubuntu24

docker-tag-void-linux-musl:
	docker tag n4jm4/rockhopper:void-linux-musl n4jm4/rockhopper:$(VERSION)-void-linux-musl

test: docker-build
	sh -c "cd examples/sh && ./demo && tree .rockhopper"
