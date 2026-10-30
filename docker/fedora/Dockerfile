FROM library/fedora:44 AS build
RUN dnf install -y cargo && \
    cargo install rsubst@0.2.1

FROM library/fedora:44
ARG ROCKHOPPER_VERSION
ENV ROCKHOPPER_VERSION=$ROCKHOPPER_VERSION
RUN dnf install -y \
        rpmdevtools \
        rpmlint && \
    dnf clean all
COPY --from=build /root/.cargo/bin/rsubst /usr/local/bin
COPY templates /root/templates
COPY bin /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
