#!/bin/sh

/etc/init.d/mysql start

sleep 5s

/usr/bin/mysql -e "CREATE USER 'root'@'$WEB1_PORT_80_TCP_ADDR' IDENTIFIED BY ''; GRANT ALL ON *.* to 'root'@'$WEB1_PORT_80_TCP_ADDR'; FLUSH PRIVILEGES"

cat <<EOF >>~/.bashrc
trap '/etc/init.d/mysql stop; exit 0' TERM
EOF
exec /bin/bash

