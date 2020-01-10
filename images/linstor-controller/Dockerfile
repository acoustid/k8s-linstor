FROM ubuntu:bionic

ARG JDBC_POSTGRESQL_VERSION=42.2.9

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y gnupg2 && \
    apt-key adv --recv-key --keyserver keyserver.ubuntu.com 34893610CEAA9512 && \
    echo "deb http://ppa.launchpad.net/linbit/linbit-drbd9-stack/ubuntu bionic main" > /etc/apt/sources.list.d/linbit-ppa.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y default-jre-headless && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y linstor-client linstor-controller wget && \
    apt-get autoremove -y gnupg2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    mkdir /var/log/linstor-controller && \
    ln -s /dev/stdout /var/log/linstor-controller/rest-access.log && \
    ln -s /dev/stdout /var/log/linstor-controller/linstor-Controller.log && \
    wget https://jdbc.postgresql.org/download/postgresql-${JDBC_POSTGRESQL_VERSION}.jar \
      -O /usr/share/linstor-server/lib/postgresql-${JDBC_POSTGRESQL_VERSION}.jar

COPY entry.sh /entry.sh

ENTRYPOINT ["/entry.sh"]
