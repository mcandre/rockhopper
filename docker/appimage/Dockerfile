FROM library/ubuntu:26.04 AS build
ENV PATH=$PATH:/root/.cargo/bin
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        build-essential \
        ca-certificates \
        curl && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | \
        sh -s -- --no-modify-path -y && \
    cargo install rsubst@0.2.1 && \
    curl -Lo /usr/local/bin/appimagetool-aarch64.AppImage "https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-aarch64.AppImage" && \
    curl -Lo /usr/local/bin/appimagetool-x86_64.AppImage "https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage" && \
    chmod +x /usr/local/bin/appimagetool-*.AppImage

FROM library/ubuntu:26.04
ARG ROCKHOPPER_VERSION
ENV ROCKHOPPER_VERSION=$ROCKHOPPER_VERSION
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        appstream \
        appstream-util \
        build-essential \
        ca-certificates \
        curl \
        file \
        fuse \
        gpg && \
    rm -rf /var/lib/apt/lists/*
COPY --from=build /root/.cargo/bin/rsubst /usr/local/bin
COPY --from=build /usr/local/bin/appimagetool* /usr/local/bin
COPY templates /root/templates
COPY bin /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
