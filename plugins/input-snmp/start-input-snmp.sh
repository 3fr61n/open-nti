#!/bin/ash
mkdir -p /opt/telegraf/config
opennti=$(nslookup opennti | grep Address: | grep -v '#53' | awk '{print $2}')
sed s/opennti/$opennti/g /data/templates/telegraf.tmpl > /opt/telegraf/config/telegraf.conf
/usr/bin/telegraf --config /opt/telegraf/config/telegraf.conf 

#while true; do echo "bla"; sleep 1; done
