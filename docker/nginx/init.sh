#!/bin/sh

/etc/init.d/nginx start

cat <<EOF >>~/.bashrc
trap '/etc/init.d/nginx stop; exit 0' TERM
EOF
exec /bin/bash

