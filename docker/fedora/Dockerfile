FROM library/fedora:43
RUN dnf install -y \
        rpmdevtools \
        rpmlint && \
    curl -LO https://github.com/jtdowney/rsubst/releases/download/v0.1.4/rsubst-x86_64-unknown-linux-musl.tar.gz && \
    tar xf rsubst-x86_64-unknown-linux-musl.tar.gz && \
    mv rsubst /usr/bin && \
    rm -rf rsubst-x86_64-unknown-linux-musl.tar.gz && \
    mkdir /root/rockhopper-specs
COPY .spec.j2 /root/rockhopper-specs
COPY rocklet /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
