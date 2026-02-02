.POSIX:
.SILENT:
.PHONY: \
	all \
	docker-build \
	docker-build-alpine \
	docker-build-arch \
	docker-build-debian \
	docker-build-rhel \
	docker-build-slack
	docker-push \
	docker-push-alpine \
	docker-push-arch \
	docker-push-debian \
	docker-push-rhel \
	docker-push-slack \
	test
.IGNORE: \
	clean

all: docker-build

clean:
	find . -type d -name .rockhopper -exec rm -rf "{}" \;

docker-build: \
	docker-build-alpine \
	docker-build-arch \
	docker-build-debian \
	docker-build-rhel \
	docker-build-slack

docker-build-alpine:
	sh -c "cd docker/alpine && docker build -t n4jm4/rockhopper:alpine . --load"

docker-build-arch:
	sh -c "cd docker/arch && docker build -t n4jm4/rockhopper:arch . --load"

docker-build-debian:
	sh -c "cd docker/debian && docker build -t n4jm4/rockhopper:debian . --load"

docker-build-rhel:
	sh -c "cd docker/rhel && docker build -t n4jm4/rockhopper:rhel . --load"

docker-build-slack:
	sh -c "cd docker/slack && docker build -t n4jm4/rockhopper:slack . --load"

docker-push: \
	docker-push-alpine \
	docker-push-arch \
	docker-push-debian \
	docker-push-rhel \
	docker-push-slack

docker-push-alpine:
	docker push n4jm4/rockhopper:alpine

docker-push-arch:
	docker push n4jm4/rockhopper:arch

docker-push-debian:
	docker push n4jm4/rockhopper:debian

docker-push-rhel:
	docker push n4jm4/rockhopper:rhel

docker-push-slack:
	docker push n4jm4/rockhopper:slack

test: clean
	sh -c "cd examples/sh && ./demo"
