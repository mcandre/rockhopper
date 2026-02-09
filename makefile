.POSIX:
.SILENT:
.PHONY: \
	all \
	docker-build \
	docker-build-alpine \
	docker-build-arch \
	docker-build-debian \
	docker-build-fedora \
	docker-build-mint \
	docker-build-raspbian \
	docker-build-slack \
	docker-build-ubuntu \
	docker-push \
	docker-tag \
	docker-tag-alpine \
	docker-tag-arch \
	docker-tag-debian \
	docker-tag-fedora \
	docker-tag-mint \
	docker-tag-raspbian \
	docker-tag-slack \
	docker-tag-ubuntu \
	test
.IGNORE: \
	clean

VERSION=0.0.7

all: docker-build

clean:
	find . -type d -name .rockhopper -exec rm -rf "{}" \;

docker-build: \
	docker-build-alpine \
	docker-build-arch \
	docker-build-debian \
	docker-build-fedora \
	docker-build-mint \
	docker-build-raspbian \
	docker-build-slack \
	docker-build-ubuntu

docker-build-alpine:
	sh -c "cd docker/alpine && docker build -t n4jm4/rockhopper:alpine . --load"

docker-build-arch:
	sh -c "cd docker/arch && docker build -t n4jm4/rockhopper:arch . --load"

docker-build-debian:
	sh -c "cd docker/debian && docker build -t n4jm4/rockhopper:debian . --load"

docker-build-fedora:
	sh -c "cd docker/fedora && docker build -t n4jm4/rockhopper:fedora . --load"

docker-build-mint:
	sh -c "cd docker/mint && docker build -t n4jm4/rockhopper:mint . --load"

docker-build-raspbian:
	sh -c "cd docker/raspbian && docker build -t n4jm4/rockhopper:raspbian . --load"

docker-build-slack:
	sh -c "cd docker/slack && docker build -t n4jm4/rockhopper:slack . --load"

docker-build-ubuntu:
	sh -c "cd docker/ubuntu && docker build -t n4jm4/rockhopper:ubuntu . --load"

docker-clean-tags:
	docker images 2>/dev/null | \
		grep '^n4jm4/rockhopper' | \
		awk '{print $$1 }' | \
		xargs -n 1 docker rmi -f

docker-push: docker-clean-tags docker-build docker-tag
	docker push n4jm4/rockhopper --all-tags

docker-tag: \
	docker-tag-alpine \
	docker-tag-arch \
	docker-tag-debian \
	docker-tag-fedora \
	docker-tag-mint \
	docker-tag-raspbian \
	docker-tag-slack \
	docker-tag-ubuntu

docker-tag-alpine:
	docker tag n4jm4/rockhopper:alpine n4jm4/rockhopper:$(VERSION)-alpine3.23
	docker tag n4jm4/rockhopper:alpine n4jm4/rockhopper:$(VERSION)-alpine3
	docker tag n4jm4/rockhopper:alpine n4jm4/rockhopper:$(VERSION)-alpine
	docker tag n4jm4/rockhopper:alpine n4jm4/rockhopper:alpine3.23
	docker tag n4jm4/rockhopper:alpine n4jm4/rockhopper:alpine3

docker-tag-arch:
	docker tag n4jm4/rockhopper:arch n4jm4/rockhopper:$(VERSION)-arch

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

docker-tag-mint:
	docker tag n4jm4/rockhopper:mint n4jm4/rockhopper:$(VERSION)-zena
	docker tag n4jm4/rockhopper:mint n4jm4/rockhopper:$(VERSION)-mint22.3
	docker tag n4jm4/rockhopper:mint n4jm4/rockhopper:$(VERSION)-mint22
	docker tag n4jm4/rockhopper:mint n4jm4/rockhopper:$(VERSION)-mint
	docker tag n4jm4/rockhopper:mint n4jm4/rockhopper:zena
	docker tag n4jm4/rockhopper:mint n4jm4/rockhopper:mint22.3
	docker tag n4jm4/rockhopper:mint n4jm4/rockhopper:mint22

docker-tag-raspbian:
	docker tag n4jm4/rockhopper:raspbian n4jm4/rockhopper:$(VERSION)-raspbian6-trixie
	docker tag n4jm4/rockhopper:raspbian n4jm4/rockhopper:$(VERSION)-raspbian6
	docker tag n4jm4/rockhopper:raspbian n4jm4/rockhopper:$(VERSION)-raspbian-trixie
	docker tag n4jm4/rockhopper:raspbian n4jm4/rockhopper:$(VERSION)-raspbian
	docker tag n4jm4/rockhopper:raspbian n4jm4/rockhopper:raspbian6-trixie
	docker tag n4jm4/rockhopper:raspbian n4jm4/rockhopper:raspbian6
	docker tag n4jm4/rockhopper:raspbian n4jm4/rockhopper:raspbian-trixie

docker-tag-slack:
	docker tag n4jm4/rockhopper:slack n4jm4/rockhopper:$(VERSION)-slack15.0
	docker tag n4jm4/rockhopper:slack n4jm4/rockhopper:$(VERSION)-slack15
	docker tag n4jm4/rockhopper:slack n4jm4/rockhopper:$(VERSION)-slack
	docker tag n4jm4/rockhopper:slack n4jm4/rockhopper:slack15.0
	docker tag n4jm4/rockhopper:slack n4jm4/rockhopper:slack15

docker-tag-ubuntu:
	docker tag n4jm4/rockhopper:ubuntu n4jm4/rockhopper:$(VERSION)-noble
	docker tag n4jm4/rockhopper:ubuntu n4jm4/rockhopper:$(VERSION)-ubuntu24.04
	docker tag n4jm4/rockhopper:ubuntu n4jm4/rockhopper:$(VERSION)-ubuntu24
	docker tag n4jm4/rockhopper:ubuntu n4jm4/rockhopper:$(VERSION)-ubuntu
	docker tag n4jm4/rockhopper:ubuntu n4jm4/rockhopper:noble
	docker tag n4jm4/rockhopper:ubuntu n4jm4/rockhopper:ubuntu24.04
	docker tag n4jm4/rockhopper:ubuntu n4jm4/rockhopper:ubuntu24

test:
	sh -c "cd examples/sh && ./demo && tree .rockhopper"
