#!/bin/bash

adlist="blocked-hosts"
ads=/tmp/${adlist}

echo "Updating PiHole's Adblock List (for Qutebrowser)"

rm -f ${ads}

curl -s https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts | awk '/^0.0.0.0/ {print $2}' >> ${ads}
curl -s https://mirror1.malwaredomains.com/files/justdomains >> ${ads}
curl -s http://sysctl.org/cameleon/hosts | cut -f2 -d' ' >> ${ads}
curl -s https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt >> ${ads}
curl -s https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt >> ${ads}

cat ${ads} | sed 's/www.//' | sort -u > ${adlist}
