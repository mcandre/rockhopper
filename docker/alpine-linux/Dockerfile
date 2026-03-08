FROM library/alpine:3.23 AS build
RUN apk add -U cargo && \
    cargo install rsubst@0.2.1

FROM library/alpine:3.23
# Include a test keypair for signing packages
ARG ROCKHOPPER_VERSION
ENV ROCKHOPPER_VERSION=$ROCKHOPPER_VERSION
RUN apk add -U --no-cache \
        alpine-sdk \
        atools \
        bash \
        sudo && \
    abuild-keygen -n -a -i
COPY --from=build /root/.cargo/bin/rsubst /usr/local/bin
COPY templates /root/templates
COPY bin /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
