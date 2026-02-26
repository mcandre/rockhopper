FROM library/ubuntu:24.04
ENV PATH=$PATH:/root/.cargo/bin
RUN apt update && \
    apt install -y \
        build-essential \
        curl && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path && \
    cargo install minijinja-cli@2.16.0 && \
    mkdir /root/rockhopper-specs
COPY control.j2 /root/rockhopper-specs
COPY copyright.j2 /root/rockhopper-specs
COPY rocklet /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
