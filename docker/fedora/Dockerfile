FROM library/fedora:43
RUN dnf install -y rpmdevtools rpmlint
COPY rockhopper /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rockhopper"]
