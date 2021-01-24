FROM golang:1.15.7-alpine3.13
ARG RECONFTW_VERSION=0.9-beta1
WORKDIR /app
ENV LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_ALL="en_US.UTF-8" \
    GOOS="linux" \
    GOPATH="/go" \
    GOROOT="/usr/local/go"
RUN apk add bash git
RUN git clone --depth 1 https://github.com/six2dez/reconftw.git -b $RECONFTW_VERSION . && \
    chmod +x install.sh && \
    bash -x ./install.sh
ENTRYPOINT ["/app/reconftw.sh"]
