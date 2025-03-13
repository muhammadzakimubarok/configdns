#!/bin/bash

#Meminta input dari pengguna
read -p "Masukan Nama Domain, Contoh (ukk-tkj.net):" domainzone
read -p "Masukan Nama File Forward, Contoh (db.domain):" forward
read -p "Masukan IP Address dengan Posisi Terbalik, Contoh Jika IP 172.16.11.114, Maka Input 114.11.16.172:" reversezone
read -p "Masukan Nama File Reverse, Contoh (db.ip):" reverse

#Membuat isi named.conf.local
config_content="
zone \""$domainzone"\" {
	type master;
	file \""/etc/bind/db.$forward"\";
};

zone \""$reversezone.in-addr.arpa"\" {
	type master;
	file \""/etc/bind/db.$reverse"\";
};
"

# Menyimpan isi named.conf.local ke dalam file
echo "$config_content" > named-new.conf.local

# ubah group  menjadi bind untuk file db
chgrp bind named-new.conf.local

# Memindahkan dan mengganti konfigurasi dns
mv named-new.conf.local /etc/bind/

cd /etc/bind/
mv named-new.conf.local named.conf.local

echo "Konfigurasi named.conf.local telah berhasil dibuat."
