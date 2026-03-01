FROM library/ubuntu:25.04 AS build
ENV PATH=$PATH:/root/.cargo/bin
RUN apt update && \
    apt install --no-install-recommends -y \
        build-essential \
        ca-certificates \
        curl \
        git && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | \
        sh -s -- --no-modify-path -y && \
    cargo install rsubst@0.2.1 && \
    git clone --depth 1 https://github.com/hogliux/bomutils.git && \
    cd bomutils && \
    make all

FROM library/ubuntu:25.04
RUN apt update && \
    apt install --no-install-recommends -y \
        libarchive-tools \
        xar && \
    rm -rf /var/lib/apt/lists/*
COPY --from=build /root/.cargo/bin/rsubst /usr/local/bin
COPY --from=build /bomutils/build/bin /usr/local/bin
COPY templates /root/templates
COPY mename /usr/local/bin
COPY rocklet /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
