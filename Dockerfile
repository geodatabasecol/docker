FROM debian:bullseye

LABEL update "2021/12/19"

ENV VERSION "6.21.0"

WORKDIR /src
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget && \
    wget https://github.com/xmrig/xmrig/releases/download/v6.21.0/xmrig-${VERSION}-linux-x64.tar.gz -O /tmp/xmrig.tar.gz && \
    tar -zxvf /tmp/xmrig.tar.gz -C /tmp && \
    mv /tmp/xmrig-${VERSION}/xmrig /usr/bin && \
    apt-get purge -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN useradd --system --uid 666 -M --shell /usr/sbin/nologin miner
USER miner

USER root

COPY $PWD/entrypoint.sh /srv/
RUN chmod +x /srv/entrypoint.sh
ENTRYPOINT ["/srv/entrypoint.sh"]



