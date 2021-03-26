FROM golang:1.15.10-alpine3.13
ARG RECONFTW_VERSION=v1.3.0
WORKDIR /app
ENV LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_ALL="en_US.UTF-8" \
    GOOS="linux" \
    GOPATH="/go" \
    GOROOT="/usr/local/go"
RUN apk add --update --no-cache bash python3 py3-pip ruby curl wget chromium xvfb sudo nmap git jq bind-tools lynx && \
    apk add --no-cache --virtual .install-deps gcc-go make libc-dev python3-dev libpcap-dev openssl-dev libxslt-dev libffi-dev libxml2-dev zlib-dev && \
    pip install shodan && \
    git clone --depth 1 https://github.com/six2dez/reconftw.git -b $RECONFTW_VERSION . && \
    chmod +x install.sh && \
    bash -x ./install.sh && \
    GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@v2.4.5 && \
    apk del .install-deps
ENTRYPOINT ["/app/reconftw.sh"]
