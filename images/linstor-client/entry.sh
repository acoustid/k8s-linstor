#!/bin/sh

exec /usr/share/linstor-server/bin/Controller --logs=/var/log/linstor-controller --config-directory=/etc/linstor --rest-bind=0.0.0.0:3370 "$@"
