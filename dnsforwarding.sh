#!/bin/bash

#Meminta input dari pengguna
read -p "Masukan Network Client Allow DNS:" networkclient1
read -p "Masukan Network Client Allow DNS:" networkclient2
read -p "Masukan DNS Public:" dns

#Membuat isi named.conf.local
config_content="
acl trusted {
        $networkclient1;
        $networkclient2;
};

options {
	directory \"/var/cache/bind\";

	forwarders{
	$dns;
	};
	recursion yes;
    allow-recursion {trusted; };
    dnssec-validation auto;

    listen-on-v6 { any; };
};
"

# Menyimpan isi named.conf.options ke dalam file
echo "$config_content" > named-new.conf.options

# ubah group  menjadi bind untuk file db
chgrp bind named-new.conf.options

# Memindahkan dan mengganti konfigurasi dns
mv named-new.conf.options /etc/bind/

cd /etc/bind/
mv named-new.conf.options named.conf.options

# Mereload konfigurasi DNS
systemctl reload bind9

echo "Konfigurasi named.conf.options telah berhasil dibuat."
