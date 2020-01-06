FROM ubuntu:bionic

ARG DRBD_VERSION=9.0.21-1

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y kmod gnupg wget make gcc cpp patch curl coccinelle ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget https://www.linbit.com/downloads/drbd/9.0/drbd-${DRBD_VERSION}.tar.gz -O /drbd.tar.gz && \
    wget https://raw.githubusercontent.com/LINBIT/drbd/drbd-${DRBD_VERSION}/docker/entry.sh -O /entry.sh && \
    chmod +x /entry.sh

ENTRYPOINT ["/entry.sh"]
