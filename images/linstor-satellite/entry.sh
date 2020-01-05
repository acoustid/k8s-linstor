#!/bin/sh

exec /usr/share/linstor-server/bin/Satellite --logs=/var/log/linstor-satellite --config-directory=/etc/linstor --skip-hostname-check "$@"
