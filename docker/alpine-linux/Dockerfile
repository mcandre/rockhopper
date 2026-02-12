FROM library/alpine:3.23
# Includes a test keypair for signing packages
RUN apk add -U --no-cache \
        alpine-sdk \
        atools \
        bash \
        curl \
        sudo && \
    curl -LO https://github.com/jtdowney/rsubst/releases/download/v0.1.4/rsubst-x86_64-unknown-linux-musl.tar.gz && \
    tar xf rsubst-x86_64-unknown-linux-musl.tar.gz && \
    mv rsubst /usr/bin && \
    rm -rf rsubst-x86_64-unknown-linux-musl.tar.gz && \
    apk del curl && \
    abuild-keygen -n -a -i && \
    mkdir /root/rockhopper-specs
COPY APKBUILD.j2 /root/rockhopper-specs
COPY rocklet /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
