FROM library/fedora:43
RUN dnf install -y rpmdevtools rpmlint
COPY rocklet /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
