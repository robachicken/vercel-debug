#/bin/bash
# run these commands from the same (problematic) network/machine

#choose domain
read -p "Enter enter domain (eg vercel.com): " domain

# Capture time/date
date

# This shows the reporter's global IP address
curl https://ipinfo.io/

# Test reachability to Vercel A record
ping -c 4 76.76.21.21
traceroute -w 1 -m 30 76.76.21.21

# Test reachability to Vercel CNAME records
for i in "76.76.21.22" "76.76.21.9" "76.76.21.241" "76.76.21.164" "76.76.21.142" "76.76.21.61" "76.76.21.93" "76.76.21.123" "76.76.21.98"
do 
ping -c 4 $i
#traceroute -w 1 -m 30 $i
#done

# Dig your domain
dig $domain

# Dig your domain via public DNS
dig $domain @8.8.8.8

# curl content
curl -sv https://$domain

# mtr result
# sudo mtr -wr -c 20 76.76.21.21

