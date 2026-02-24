FROM library/fedora:43
ENV PATH=$PATH:/root/.cargo/bin
RUN dnf install -y \
        cargo \
        rpmdevtools \
        rpmlint && \
    cargo install rsubst@0.1.4 && \
    mkdir /root/rockhopper-specs
COPY .spec.j2 /root/rockhopper-specs
COPY rocklet /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
