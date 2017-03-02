cat /var/log/bgp-dump-file.txt| grep dump_close | sed -e '$ ! s/$/,/g' | sed s/timestamp/snapshot/g | xargs -0 -I {} echo [ {} ]
