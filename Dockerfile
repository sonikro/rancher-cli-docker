FROM ubuntu:16.04
MAINTAINER Jonathan Nagayoshi
WORKDIR /tmp
RUN apt-get update
RUN apt-get install -y wget
RUN wget https://github.com/rancher/cli/releases/download/v2.3.0/rancher-linux-amd64-v2.3.0.tar.gz \
    && tar zxvpf rancher-linux-amd64-v2.3.0.tar.gz && rm rancher-linux-amd64-v2.3.0.tar.gz
RUN mv rancher-v2.3.0/* /usr/bin

ENTRYPOINT [ "/bin/bash" ]

