FROM library/alpine:3.23
RUN apk add -U \
    alpine-sdk \
    atools \
    sudo && \
    abuild-keygen -n -a -i
COPY generate /usr/local/bin
ENTRYPOINT ["/usr/local/bin/generate"]
