FROM library/archlinux:base-devel
RUN useradd -m builder && \
    passwd -d builder
COPY rocklet /usr/local/bin
USER builder
WORKDIR /home/builder
ENTRYPOINT ["/usr/local/bin/rocklet"]
