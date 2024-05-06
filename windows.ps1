# Run these commands from the affected/problematic network
# Once completed, send the file to Vercel support

# Ensure script has domain argument passed

echo "******************"
echo "**** STARTING ****"
echo "******************"

$domain = Read-Host "Please enter your domain"

# Show affected domain
echo "Domain: ${domain}"

# Capture time/date
echo "Timestamp: $(date)"

# Output the reporters IP address
echo "IP Info: "
curl.exe -s https://ipinfo.io/
echo ""

# Test reachability to Vercel A record
echo "Testing 76.76.21.21: "
ping -n 4 76.76.21.21
tracert -w 1 -h 30 76.76.21.21

# Test reachability to Vercel CNAME records
ForEach ($i in "76.76.21.22","76.76.21.9","76.76.21.241","76.76.21.164","76.76.21.142","76.76.21.61","76.76.21.93","76.76.21.123","76.76.21.98") {
  echo "Testing $i"
  ping -n 4 $i
  tracert -w 1 -h 30 $i
}

# Resolve affected domain
echo "dig ${domain} "
nslookup -debug ${domain}

# Resolve affected domain via public DNS
echo "dig ${domain} via 8.8.8.8: "
nslookup ${domain} 8.8.8.8

# Output content of affected domain
echo "Output of ${domain}"
curl.exe -sv https://${domain}

# Output pathping. Not needed at present.
# ForEach ($i in "76.76.21.21","76.76.21.22","76.76.21.9","76.76.21.241","76.76.21.164","76.76.21.142","76.76.21.61","76.76.21.93","76.76.21.123","76.76.21.98") { echo "Testing $i"; pathping -h 30 $i}

echo ""
echo "******************"
echo "**** FINISHED ****"
echo "******************"
echo ""
echo "File can be found at $(pwd)\vercel-debug.txt"
echo ""
