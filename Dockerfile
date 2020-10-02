FROM debian:stable-slim

LABEL MAINTAINER="ivanovskyortega@gmail.com"

RUN apt-get update && apt-get upgrade -y                                                               && \
    apt-get install curl -y                                                                            && \
    groupadd -g 1000 kops                                                                              && \
    useradd -m kops -u 1000 -g 1000                                                                    && \
    curl -LJO https://github.com/kubernetes/kops/releases/download/v1.15.1/kops-linux-amd64            && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.5/bin/linux/amd64/kubectl && \
    mv kops-linux-amd64 /usr/local/bin/kops                                                            && \
    mv kubectl /usr//local/bin/kubectl                                                                 && \
    chmod +x /usr/local/bin/kops                                                                       && \
    chmod +x /usr/local/bin/kubectl                                                                    && \
    chown kops:kops /usr/local/bin/kops                                                                && \
    chown kops:kops /usr/local/bin/kubectl

USER kops

ENTRYPOINT ["bash"]

