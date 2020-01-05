FROM ubuntu:bionic

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y gnupg2 && \
    apt-key adv --recv-key --keyserver keyserver.ubuntu.com 34893610CEAA9512 && \
    echo "deb http://ppa.launchpad.net/linbit/linbit-drbd9-stack/ubuntu bionic main" > /etc/apt/sources.list.d/linbit-ppa.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y linstor-client && \
    apt-get autoremove -y gnupg2 && \
    apt-get clean

COPY entry.sh /entry.sh

ENTRYPOINT ["/entry.sh"]
