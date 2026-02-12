FROM library/archlinux:base-devel
RUN curl -LO https://github.com/jtdowney/rsubst/releases/download/v0.1.4/rsubst-x86_64-unknown-linux-musl.tar.gz && \
    tar xf rsubst-x86_64-unknown-linux-musl.tar.gz && \
    mv rsubst /usr/bin && \
    rm -rf rsubst-x86_64-unknown-linux-musl.tar.gz && \
    useradd -m builder && \
    passwd -d builder && \
    mkdir /home/builder/rockhopper-specs
COPY PKGBUILD.j2 /home/builder/rockhopper-specs
COPY rocklet /usr/local/bin
WORKDIR /home/builder
USER builder
ENTRYPOINT ["/usr/local/bin/rocklet"]
