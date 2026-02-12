FROM aclemons/slackware:15.0
RUN slackpkg update && \
    slackpkg install \
        brotli \
        curl \
        cyrus-sasl \
        nghttp2 && \
    mkdir /usr/share/curl
ADD https://curl.se/ca/cacert.pem /usr/share/curl
RUN CURL_CA_BUNDLE=/usr/share/curl/cacert.pem curl -LO https://github.com/jtdowney/rsubst/releases/download/v0.1.4/rsubst-x86_64-unknown-linux-musl.tar.gz && \
    tar xf rsubst-x86_64-unknown-linux-musl.tar.gz && \
    mv rsubst /usr/bin && \
    rm -rf rsubst-x86_64-unknown-linux-musl.tar.gz && \
    rm -rf /usr/share/curl && \
    removepkg \
        brotli \
        curl \
        cyrus-sasl \
        nghttp2 && \
    rm -rf /var/cache/slackpkg/* && \
    mkdir /root/rockhopper-specs
COPY slack-desc.j2 /root/rockhopper-specs
COPY rocklet /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
