#/bin/bash
# run these commands from the same (problematic) network/machine
# once completed, send the file to Vercel support

echo "** STARTING **"

#choose domain
read -p "Enter enter domain (eg vercel.com): " domain
echo "Domain: ${domain:=vercel.com}"

# Capture time/date
echo "Timestamp: $(date)"

# This shows the reporter's global IP address
echo "IP Info: "
curl -s https://ipinfo.io/

# Test reachability to Vercel A record
echo "Testing 76.76.21.21: "
ping -c 4 76.76.21.21
traceroute -w 1 -m 30 76.76.21.21

# Test reachability to Vercel CNAME records
for i in "76.76.21.22" "76.76.21.9" "76.76.21.241" "76.76.21.164" "76.76.21.142" "76.76.21.61" "76.76.21.93" "76.76.21.123" "76.76.21.98"
do 
  echo "Testing $i"
  ping -c 4 $i
  traceroute -w 1 -m 30 $i
done

# Dig your domain
echo "dig ${domain:=vercel.com}: "
dig ${domain:=vercel.com}

# Dig your domain via public DNS
echo "dig ${domain:=vercel.com} via 8.8.8.8: "
dig ${domain:=vercel.com} @8.8.8.8

# curl content
echo "Output of ${domain:=vercel.com}"
curl -sv https://${domain:=vercel.com}

# mtr result
# sudo mtr -wr -c 20 76.76.21.21

echo "** FINISHED **"
echo "File can be found at $(pwd)/vercel-debug.txt"
