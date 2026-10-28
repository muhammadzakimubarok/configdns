#!/bin/bash

echo "Memulai Proses Installasi DNS"
bash installdns.sh
echo "Mengkonfigurasi Pointing Zone DNS"
bash zone.sh
echo "Mengkonfigurasi File Forward DNS"
bash forward.sh
echo "Mengkonfigurasi File Reverse DNS"
bash reverse.sh
echo "Mengkonfigurasi DNS Forwarding"
bash dnsforwarding.sh
echo "Melihat Hasil Konfigurasi DNS"
bash checkconf.sh
echo "Proses Selesai ^_^"
