#! /bin/sh
alias expand_nginx_log="( cat /var/log/nginx/access.log /var/log/nginx/access.log.1 ; gunzip -c /var/log/nginx/access.log.*.gz )"
for ip in $(expand_nginx_log | nginx-log-analyzer 1 | sort -u) ; do 
	whois $ip | grep 'country:' | head -n1 | awk '{print $2}' ;
done | tr "[:lower:]" "[:upper:]" | sort | uniq -c | awk '{print $2 "," $1}' > access_ip.csv
