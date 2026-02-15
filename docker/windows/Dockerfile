FROM mcr.microsoft.com/dotnet/sdk:10.0-noble
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1
# ENV WINEDEBUG=-all
# ENV WINETRICKS_UNATTENDED=1
# ENV PATH="$PATH:/root/.dotnet"
# ENV WINEARCH=win64
# ENV WINEPREFIX=/root/.wine
# ENV WINEDEBUG=-all
RUN apt update && \
    apt install -y \
        curl \
        uuid-runtime

# RUN dpkg --add-architecture i386 && \
#     apt update && \
#     apt install -y \
#         cabextract \
#         curl \
#         gpg \
#         uuid-runtime \
#         xvfb && \
#     mkdir -pm755 /etc/apt/keyrings && \
#     curl -L https://dl.winehq.org/wine-builds/winehq.key | gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key - && \
#     curl -Lo /etc/apt/sources.list.d/winehq-trixie.sources https://dl.winehq.org/wine-builds/debian/dists/trixie/winehq-trixie.sources && \
#     apt update
# RUN apt install --install-recommends -y winehq-devel && \
#     curl -Lo /usr/local/bin/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && \
#     chmod +x /usr/local/bin/winetricks
RUN curl -LO https://github.com/jtdowney/rsubst/releases/download/v0.1.4/rsubst-x86_64-unknown-linux-musl.tar.gz && \
    tar xf rsubst-x86_64-unknown-linux-musl.tar.gz && \
    mv rsubst /usr/bin && \
    rm -rf rm rsubst-x86_64-unknown-linux-musl.tar.gz && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
# RUN useradd -m builder && \
#     passwd -d builder
# USER builder
# WORKDIR /home/builder
# RUN winetricks -q dotnet6
# RUN winetricks -q dotnet7
# RUN winetricks -q dotnet8
# RUN winetricks -q dotnet9
# RUN xvfb-run winetricks -q -f nocrashdialog dotnet6
# RUN xvfb-run winetricks -q -f nocrashdialog dotnet10
# RUN xvfb-run winetricks dotnet10
# RUN xvfb-run winetricks -q dotnet10
RUN mkdir /root/rockhopper-specs
COPY QuickStart.wixproj /root/rockhopper-specs
# COPY wix-tree /usr/local/bin
COPY Package.wxs.j2 /root/rockhopper-specs
COPY rocklet /usr/local/bin
ENTRYPOINT ["/usr/local/bin/rocklet"]
