FROM library/ubuntu:26.04 AS build
ENV PATH=$PATH:/root/.cargo/bin
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        build-essential \
        ca-certificates \
        curl && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | \
        sh -s -- --no-modify-path -y && \
    cargo install rsubst@0.2.1

FROM library/ubuntu:26.04
ARG ROCKHOPPER_VERSION
ENV ROCKHOPPER_VERSION=$ROCKHOPPER_VERSION
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        libarchive-tools \
        openssl && \
    rm -rf /var/lib/apt/lists/* && \
    groupadd wheel
COPY --from=build /root/.cargo/bin/rsubst /usr/local/bin
COPY templates /root/templates
COPY bin /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
