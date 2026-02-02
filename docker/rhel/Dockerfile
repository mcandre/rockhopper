FROM library/fedora:43
RUN dnf install -y rpmdevtools rpmlint
COPY generate /usr/local/bin
ENTRYPOINT ["/usr/local/bin/generate"]
