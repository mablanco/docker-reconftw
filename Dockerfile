FROM debian:buster-20210326-slim
ARG RECONFTW_VERSION=v1.3.0
ENV DEBIAN_FRONTEND=noninteractive \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_ALL="en_US.UTF-8"
#ENV GOOS="linux" \
#    GOPATH="/root/go" \
#    GOROOT="/usr/local/go"
WORKDIR /root/Tools/reconftw
RUN sed -i 's/main/main contrib non-free/' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -yq install apt-utils locales git curl && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen && \
    apt-get -yq dist-upgrade && \
    git clone --depth 1 https://github.com/six2dez/reconftw.git -b $RECONFTW_VERSION . && \
    chmod +x install.sh && \
    bash -x ./install.sh  && \
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/{apt,dpkg,cache,log}
ENTRYPOINT ["./reconftw.sh"]
