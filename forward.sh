#!/bin/bash

# Meminta input dari pengguna
read -p "Masukan Nama Domain: " domain
read -p "Masukan IP Address Domain: " ip_address
read -p "Masukan subdomain contoh www: " subdomain
read -p "Masukkan Nama File Forward: " forward_name
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
@		IN	A	$ip_address
$subdomain	IN	CNAME	@
"
# Menyimpan isi lb-new.conf ke dalam file
echo "$config_content" > db.$forward_name

# ubah group  menjadi bind untuk file db
chgrp bind db.$forward_name

# Memindahkan dan mengganti konfigurasi dns
mv db.$forward_name /etc/bind/

echo "Konfigurasi db.$forward_name telah berhasil dibuat."

