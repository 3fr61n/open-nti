#!/bin/bash
/usr/bin/pmacct -s -O json | sed -e '$ ! s/$/,/g' | xargs -0 -I {} echo [ {} ]
