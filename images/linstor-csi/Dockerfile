ARG LINSTOR_CSI_VERSION=v0.7.2

FROM quay.io/linbit/linstor-csi:$LINSTOR_CSI_VERSION as pkg

FROM ubuntu:bionic

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y xfsprogs && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=pkg /linstor-csi /linstor-csi

ENTRYPOINT ["/linstor-csi"]
