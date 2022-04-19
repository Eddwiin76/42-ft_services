#!/bin/sh

# Creating SSL key
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=tpierre/CN=ft_services"
openssl dhparam -dsaparam -out /etc/ssl/certs/dhparam.pem 2048

echo "root:password" | chpasswd

touch /root/niiice

telegraf &
vsftpd /etc/vsftpd/vsftpd.conf
