FROM ubuntu:bionic

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y gnupg2 && \
    apt-key adv --recv-key --keyserver keyserver.ubuntu.com 34893610CEAA9512 && \
    echo "deb http://ppa.launchpad.net/linbit/linbit-drbd9-stack/ubuntu bionic main" > /etc/apt/sources.list.d/linbit-ppa.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        linstor-satellite linstor-client drbd-utils \
        wget xfsprogs net-tools iputils-ping iproute2 \
        dnsutils netcat sysstat udev lvm2 && \
    apt-get autoremove -y gnupg2 && \
    apt-get clean && \
    mkdir /var/log/linstor-satellite && \
    ln -s /dev/stdout /var/log/linstor-satellite/linstor-Satellite.log

RUN sed -i 's/udev_rules.*=.*/udev_rules=0/ ; s/udev_sync.*=.*/udev_sync=0/ ; s/obtain_device_list_from_udev.*=.*/obtain_device_list_from_udev=0/' /etc/lvm/lvm.conf

COPY entry.sh /entry.sh

ENTRYPOINT ["/entry.sh"]
