.POSIX:
.SILENT:
.PHONY: \
	all \
	docker-build \
	docker-build-alpine \
	docker-build-arch \
	docker-build-debian \
	docker-build-fedora \
	docker-build-slack
	docker-push \
	docker-tag-alpine \
	docker-tag-arch \
	docker-tag-debian \
	docker-tag-fedora \
	docker-tag-slack \
	test
.IGNORE: \
	clean

VERSION=0.0.4

all: docker-build

clean:
	find . -type d -name .rockhopper -exec rm -rf "{}" \;

docker-build: \
	docker-build-alpine \
	docker-build-arch \
	docker-build-debian \
	docker-build-fedora \
	docker-build-slack

docker-build-alpine:
	sh -c "cd docker/alpine && docker build -t n4jm4/rockhopper:alpine . --load"

docker-build-arch:
	sh -c "cd docker/arch && docker build -t n4jm4/rockhopper:arch . --load"

docker-build-debian:
	sh -c "cd docker/debian && docker build -t n4jm4/rockhopper:debian . --load"

docker-build-fedora:
	sh -c "cd docker/fedora && docker build -t n4jm4/rockhopper:fedora . --load"

docker-build-slack:
	sh -c "cd docker/slack && docker build -t n4jm4/rockhopper:slack . --load"

docker-push: docker-build docker-tag-alpine docker-tag-arch docker-tag-debian docker-tag-fedora docker-tag-slack
	docker push n4jm4/rockhopper --all-tags

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

docker-tag-slack:
	docker tag n4jm4/rockhopper:slack n4jm4/rockhopper:$(VERSION)-slack15.0
	docker tag n4jm4/rockhopper:slack n4jm4/rockhopper:$(VERSION)-slack15
	docker tag n4jm4/rockhopper:slack n4jm4/rockhopper:$(VERSION)-slack
	docker tag n4jm4/rockhopper:slack n4jm4/rockhopper:slack15.0
	docker tag n4jm4/rockhopper:slack n4jm4/rockhopper:slack15

test:
	sh -c "cd examples/sh && ./demo && tree .rockhopper"
