#/bin/bash
# Run these commands from the affected/problematic network
# Once completed, send the file to Vercel support

echo "******************"
echo "**** STARTING ****"
echo "******************"

# Input affected domain
read -p "Enter enter domain (eg vercel.com): " domain
echo "Domain: ${1:=vercel.com}"

# Capture time/date
echo "Timestamp: $(date)"

# Output the reporter's IP address
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
echo "dig ${1:=vercel.com} "
dig ${1:=vercel.com}

# Resolve affected domain via public DNS
echo "dig ${1:=vercel.com} via 8.8.8.8: "
dig ${1:=vercel.com} @8.8.8.8

# Resolve affected domain directly
echo "dig ${1:=vercel.com} via trace: "
dig ${1:=vercel.com} +trace

# Output content of affected domain
echo "Output of ${1:-vercel.com}"
curl -sv https://${1:-vercel.com}

# Output mtr result commented out due to Sudo requirement
# for i in "76.76.21.21" "76.76.21.22" "76.76.21.9" "76.76.21.241" "76.76.21.164" "76.76.21.142" "76.76.21.61" "76.76.21.93" "76.76.21.123" "76.76.21.98";do echo "Testing $i" && sudo mtr -wr -c 20 $i;done

echo ""
echo "******************"
echo "**** FINISHED ****"
echo "******************"
echo ""
echo "File can be found at $(pwd)/vercel-debug.txt"
echo ""
