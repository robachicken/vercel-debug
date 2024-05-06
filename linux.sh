#/bin/bash
# Run these commands from the affected/problematic network
# Once completed, send the file to Vercel support

# Ensure script has domain argument passed
if [[ $# -eq 0 ]] ; then
    echo "** No domain entered.**\nIf you're manually running this script please ensure the domain is added after the script name.\neg 'vercel-debug.sh yourdomain.com'"
    exit 0
fi

echo "******************"
echo "**** STARTING ****"
echo "******************"

# Show affected domain
echo "Domain: ${1}"

# Capture time/date
echo "Timestamp: $(date)"

# Output the reporters IP address
echo "IP Info: "
curl -s https://ipinfo.io/
echo ""

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

# Resolve affected domain
echo "dig ${1} "
dig ${1}

# Resolve affected domain via public DNS
echo "dig ${1} via 8.8.8.8: "
dig ${1} @8.8.8.8

# Resolve affected domain directly
echo "dig ${1} via trace: "
dig ${1} +trace

# Output content of affected domain
echo "Output of ${1}"
curl -sv https://${1}

# Output mtr result commented out due to Sudo requirement
# for i in "76.76.21.21" "76.76.21.22" "76.76.21.9" "76.76.21.241" "76.76.21.164" "76.76.21.142" "76.76.21.61" "76.76.21.93" "76.76.21.123" "76.76.21.98";do echo "Testing $i" && sudo mtr -wr -c 20 $i;done

echo ""
echo "******************"
echo "**** FINISHED ****"
echo "******************"
echo ""
echo "File can be found at $(pwd)/vercel-debug.txt"
echo ""
