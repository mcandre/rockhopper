FROM slpcat/antix:net-23.2
RUN apt update && \
    apt install -y curl && \
    curl -LO https://github.com/jtdowney/rsubst/releases/download/v0.1.4/rsubst-x86_64-unknown-linux-musl.tar.gz && \
    tar xf rsubst-x86_64-unknown-linux-musl.tar.gz && \
    mv rsubst /usr/bin && \
    rm -rf rsubst-x86_64-unknown-linux-musl.tar.gz && \
    apt remove -y --autoremove --purge curl && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /root/rockhopper-specs
COPY control.j2 /root/rockhopper-specs
COPY rocklet /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
