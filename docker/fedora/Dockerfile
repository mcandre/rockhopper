FROM library/fedora:43 AS build
RUN dnf install -y cargo && \
    cargo install rsubst@0.2.0

FROM library/fedora:43
RUN dnf install -y \
        rpmdevtools \
        rpmlint
COPY --from=build /root/.cargo/bin/rsubst /usr/local/bin
COPY templates /root/templates
COPY rocklet /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
