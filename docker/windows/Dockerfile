FROM library/fedora:43 AS build
RUN dnf install -y cargo && \
    cargo install rsubst@0.2.1

FROM library/fedora:43
ARG ROCKHOPPER_VERSION
ENV ROCKHOPPER_VERSION=$ROCKHOPPER_VERSION
RUN dnf install -y \
        msitools \
        util-linux && \
    dnf clean all
COPY --from=build /root/.cargo/bin/rsubst /usr/local/bin
COPY templates /root/templates
COPY bin /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
