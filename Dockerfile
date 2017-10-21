FROM debian:oldstable-slim
MAINTAINER sgcclh@gmail.com

RUN apt-get update \
    && apt-get install -y wget \
    && wget --no-check-certificate https://github.com/ginuerzh/gost/releases/download/v2.4/gost_2.4_linux_amd64.tar.gz \
    && tar -xzf gost_2.4_linux_amd64.tar.gz \
    && mv gost_2.4_linux_amd64/gost /root/ \
    && apt-get remove wget -y \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf gost_2.4_linux_amd64.tar.gz  /var/lib/apt/lists/*

ENTRYPOINT ["/root/gost"]
