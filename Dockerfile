FROM ubuntu:16.04
WORKDIR /tmp
RUN apt-get update
RUN apt-get install -y wget curl
RUN wget https://github.com/rancher/cli/releases/download/v2.3.0/rancher-linux-amd64-v2.3.0.tar.gz \
    && tar zxvpf rancher-linux-amd64-v2.3.0.tar.gz && rm rancher-linux-amd64-v2.3.0.tar.gz
RUN mv rancher-v2.3.0/* /usr/bin

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/bin/kubectl
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
##Install Kustomize
RUN wget https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv3.2.3/kustomize_kustomize.v3.2.3_linux_amd64
RUN mv kustomize_kustomize.v3.2.3_linux_amd64 kustomize
RUN chmod +x kustomize
RUN mv kustomize /usr/bin/kustomize
CMD [ "rancher" ]

