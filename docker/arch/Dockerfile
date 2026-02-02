FROM library/archlinux:base-devel
RUN useradd -m builder && \
    passwd -d builder
COPY rockhopper /usr/local/bin
USER builder
WORKDIR /home/builder
ENTRYPOINT ["/usr/local/bin/rockhopper"]
