FROM sepen/crux:3.7
RUN curl -LO https://github.com/jtdowney/rsubst/releases/download/v0.1.4/rsubst-x86_64-unknown-linux-musl.tar.gz && \
    tar xf rsubst-x86_64-unknown-linux-musl.tar.gz && \
    mv rsubst /usr/bin && \
    rm -rf rsubst-x86_64-unknown-linux-musl.tar.gz && \
    mkdir -p /root/rockhopper-specs
COPY Pkgfile.j2 /root/rockhopper-specs
COPY rocklet /usr/bin
ENTRYPOINT ["/usr/bin/rocklet"]
