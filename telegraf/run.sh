#!/bin/bash

set -m
CONFIG_TEMPLATE="/telegraf.template.conf"
CONFIG_FILE="/etc/telegraf/telegraf.conf"

HOST_NAME=`curl -s http://rancher-metadata/latest/self/host/name`
RANCHER_ENV=`curl -s  http://rancher-metadata/latest/self/stack/environment_name`
sed -e "s/\${HOST_NAME}/$HOST_NAME/" \
 -e "s!\${INFLUXDB_HOST}!$INFLUXDB_HOST!" \
 -e "s/\${INFLUXDB_PORT}/$INFLUXDB_PORT/" \
 -e "s/\${DATABASE}/$RANCHER_ENV/" \
 $CONFIG_TEMPLATE > $CONFIG_FILE

echo "=> Starting Telegraf ..."

exec telegraf -config /etc/telegraf/telegraf.conf
