#!/bin/bash

echo "============================================"
echo "Check Config DNS with bash"
echo "============================================"

#check config dns zones master 
named-checkconf /etc/bind/named.conf.default-zones

#check config forwarding dns
named-checkconf /etc/bind/named.conf.options 


echo "============================================"
echo "Check Config DNS Zone with bash"
echo "============================================"

#check
cat /etc/bind/named.conf.local
read -p "Masukan Nama Zone Domain:" domain
read -p "Masukan Nama File Domain:" filedomain
read -p "Masukan Nama Zone Reverse:" reverse
read -p "Masukan Nama File Reverse:" filereverse

named-checkzone $domain /etc/bind/$filedomain

named-checkzone $reverse /etc/bind/$filereverse

echo "========================="
echo "Check Config DNS Zone is complete."
echo "=========================" 
