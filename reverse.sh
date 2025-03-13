#!/bin/bash

# Meminta input dari pengguna
read -p "Masukan Nama Domain: " domain
read -p "Masukan IP Address dengan Posisi Terbalik, Contoh Jika IP 172.16.11.114, Maka Input 114.11.16.172: " ip_address
read -p "Masukan subdomain: " subdomain
read -p "Masukkan Nama File Reverse: " reverse_name
# Membuat isi file forward
config_content="
;
; BIND data file for local loopback interface
;
\$TTL	604800
@	IN	SOA	$domain. root.$domain. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@		IN	NS	$domain.
$ip_address.in-addr.arpa.	IN	PTR	$domain.
$ip_address.in-addr.arpa.	IN	PTR	$subdomain.$domain.
"
# Menyimpan isi lb-new.conf ke dalam file
echo "$config_content" > db.$reverse_name

# ubah group  menjadi bind untuk file db
chgrp bind db.$reverse_name

# Memindahkan dan mengganti konfigurasi Nginx
mv db.$reverse_name /etc/bind/

echo "Konfigurasi db.$reverse_name telah berhasil dibuat."

