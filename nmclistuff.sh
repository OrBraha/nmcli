#!/bin/bash
#
#
#
#
#
#
#
#
echo "NMCLI Configuration Tool - "
nmcli dev status | awk ' {print $1} '
read -p "Please type device to configure: " DEVICE
read -p "Please type profile name: " PROFILENAME
read -p "Please type the connection type: " TYYPE
read -p "Please type IPV4 i.e 1.2.3.4/24 " IPV4
read -p "Please type gateway: " GATEWAY
read -p "Please type DNS: " DNSS
sleep 0.5
nmcli connection add type $TYYPE con-name $PROFILENAME ifname $DEVICE ip4 $IPV4 gw4 $GATEWAY
nmcli con mod $PROFILENAME ipv4.dns $DNSS
echo "Configuartion completed, Running connectivity test..."
if ping -c 1 google.com &> /dev/null
then
  echo "Conecction test Success"
else
  echo "Connection test FAIL"
fi
echo "Showing profiles - : "
echo "____________________"
nmcli device status

## add ping test
#print output
