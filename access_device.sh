#! /bin/sh
alias expand_nginx_log="( cat /var/log/nginx/access.log /var/log/nginx/access.log.1 ; gunzip -c /var/log/nginx/access.log.*.gz )"
expand_nginx_log | nginx-log-analyzer 9 | sort | uniq -c | sed -e s'/^ *\([0-9]\+\) *\([^ ].*[^ ]\) *$/\2\t\1/' > access_device.tsv
