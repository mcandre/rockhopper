FROM library/alpine:3.23 AS build
RUN apk add -U cargo && \
    cargo install rsubst@0.2.0

FROM library/alpine:3.23
# Include a test keypair for signing packages
RUN apk add -U --no-cache \
        alpine-sdk \
        atools \
        bash \
        sudo && \
    abuild-keygen -n -a -i
COPY --from=build /root/.cargo/bin/rsubst /usr/local/bin
COPY templates /root/templates
COPY rocklet /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
