#!/bin/bash

mkdir -p /opt/telegraf/config
opennti=$(nslookup opennti | grep Address: | grep -v '#53' | awk '{print $2}')
sed s/opennti/$opennti/g /data/templates/telegraf-xflow-internal.tmpl > /opt/telegraf/config/telegraf-xflow-internal.tmpl
/usr/bin/telegraf --config /opt/telegraf/config/telegraf-xflow-internal.tmpl 

#while true; do echo "bla"; sleep 1; done
