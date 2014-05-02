#! /bin/sh
alias expand_nginx_log="( cat /var/log/nginx/access.log /var/log/nginx/access.log.1 ; gunzip -c /var/log/nginx/access.log.*.gz )"
expand_nginx_log | nginx-log-analyzer 4 | sed -e s'|^\(.*\)/\(.*\)/\([^:]*\):|\3/\2/\1:|' | sed -e s'|:.*$||' | sort | uniq -c | awk '{print $2 "," $1}' > access_number.csv