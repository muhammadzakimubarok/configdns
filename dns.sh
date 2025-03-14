#!/bin/bash

echo "============================================"
echo "set zones with perl find and replace"
echo "============================================"

#change dir to wordpress
cd /etc/bind/

# Meminta input dari pengguna
read -p "Masukan IP Address Domain: " ipaddress
read -p "Masukan Nama Domain: " domain
read -p "Masukan Reverse IP Domain contoh 11.16.172.in-addr.arpa: " reversedomain
read -p "Masukan Host IP Domain contoh 118: " ipaddresshost

#set database details with perl find and replace
perl -pi -e "s/localhost/$domain/g" named.conf.default-zones
perl -pi -e "s/127.in-addr.arpa/$reversedomain/g" named.conf.default-zones
perl -pi -e "s/localhost/$domain/g" db.local
perl -pi -e "s/127.0.0.1/$ipaddress/g" db.local
perl -pi -e "s/localhost/$domain/g" db.127
perl -pi -e "s/1.0.0/$ipaddresshost/g" db.127