FROM library/alpine:3.23
# Includes a test keypair for signing packages
ENV PATH=$PATH:/root/.cargo/bin
RUN apk add -U --no-cache \
        alpine-sdk \
        atools \
        bash \
        cargo \
        sudo && \
    cargo install rsubst@0.1.4 && \
    abuild-keygen -n -a -i && \
    mkdir /root/rockhopper-specs
COPY APKBUILD.j2 /root/rockhopper-specs
COPY COPYING.j2 /root/rockhopper-specs
COPY rocklet /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
