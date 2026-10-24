FROM gentoo/stage3 AS build
ENV PATH=$PATH:/root/.cargo/bin
RUN echo 'FEATURES="getbinpkg -ipc-sandbox -pid-sandbox -network-sandbox -usersandbox -mount-sandbox -sandbox parallel-install parallel-fetch -merge-sync"' >> /etc/portage/make.conf && \
    emerge-webrsync -q && \
    emerge --getbinpkg net-misc/curl && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | \
        sh -s -- --no-modify-path -y && \
    cargo install rsubst@0.2.1

FROM gentoo/stage3
ARG ROCKHOPPER_VERSION
ENV ROCKHOPPER_VERSION=$ROCKHOPPER_VERSION
RUN echo 'FEATURES="getbinpkg -ipc-sandbox -pid-sandbox -network-sandbox -usersandbox -mount-sandbox -sandbox parallel-install parallel-fetch -merge-sync"' >> /etc/portage/make.conf && \
    emerge-webrsync -q && \
    chown -R portage:portage /var/cache/distfiles /var/db/repos
COPY --from=build /root/.cargo/bin/rsubst /usr/local/bin
COPY templates /root/templates
COPY bin /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
