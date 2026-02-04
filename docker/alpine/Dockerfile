FROM library/alpine:3.23
# Includes a test keypair for signing packages
RUN apk add -U \
    alpine-sdk \
    atools \
    bash \
    sudo && \
    abuild-keygen -n -a -i
COPY rocklet /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
