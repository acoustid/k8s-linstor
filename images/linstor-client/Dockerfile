FROM ubuntu:bionic

RUN { echo 'APT::Install-Recommends "false";' ; echo 'APT::Install-Suggests "false";' ; } > /etc/apt/apt.conf.d/99_linstor
RUN apt-get update && apt-get install -y gnupg2 && \
    apt-key adv --recv-key --keyserver keyserver.ubuntu.com 34893610CEAA9512 && \
    echo "deb http://ppa.launchpad.net/linbit/linbit-drbd9-stack/ubuntu bionic main" > /etc/apt/sources.list.d/linbit-ppa.list && \
    apt-get update && \
    apt-get install -y linstor-client && \
    apt-get autoremove -y gnupg2 && \
    apt-get clean

COPY entry.sh /entry.sh

ENTRYPOINT ["/entry.sh"]
