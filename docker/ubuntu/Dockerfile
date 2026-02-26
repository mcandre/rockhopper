FROM library/ubuntu:24.04 AS build
ENV PATH=$PATH:/root/.cargo/bin
RUN apt update && \
    apt install --no-install-recommends -y \
        build-essential \
        ca-certificates \
        curl && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | \
        sh -s -- --no-modify-path -y && \
    cargo install rsubst@0.2.0

FROM library/ubuntu:24.04
COPY --from=build /root/.cargo/bin/rsubst /usr/local/bin
COPY templates /root/templates
COPY rocklet /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
