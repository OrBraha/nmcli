#!/bin/bash
# Or Braha
# Homework - nmcli practice.
# Version 0.1, still needs work.

## Display available devices to user.
echo "Displaying available devices:  "
echo "------------------------------------"
nmcli dev status | awk ' {print   $1 } ' | grep -v -i "Device" 
echo "------------------------------------"

# Ask user to config.
read -p "Please type device to configure: " DEVICE
read -p "Please type profile name: " PROFILENAME
read -p "Please type the connection type: " TYYPE
read -p "Please type IPV4 i.e 1.2.3.4/24 " IPV4
read -p "Please type gateway: " GATEWAY
read -p "Please type DNS: " DNSS
nmcli connection add type $TYYPE con-name $PROFILENAME ifname $DEVICE ip4 $IPV4 gw4 $GATEWAY
nmcli con mod $PROFILENAME ipv4.dns $DNSS

# New profile connection test.
echo "Configuartion completed, Running connectivity test..."
echo "Connecting to new profile..."
nmcli connection up $PROFILENAME
ping -c 1 google.com  &> /dev/null && echo "Connection test successful, disconnecting." || echo "Connection Failed, disconnecting."
nmcli connection down $PROFILENAME


#Display output.
echo "Showing profiles - : "
sleep 0.5
echo "____________________"
nmcli connection show
echo "____________________"

