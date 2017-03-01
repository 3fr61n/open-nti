#!/bin/bash

cp /data/templates/nfacctd.tmpl /source/nfacctd.config
/usr/sbin/nfacctd -f /source/nfacctd.config >>/var/log/nfacctd.log 2>&1 & 

mkdir -p /opt/telegraf/config
opennti=$(cat /etc/hosts | grep "opennti " | cut -f1)
sed s/opennti/$opennti/g /data/templates/telegraf.tmpl > /opt/telegraf/config/telegraf.conf
/usr/bin/telegraf --config /opt/telegraf/config/telegraf.conf 

#while true; do echo "bla"; sleep 1; done
