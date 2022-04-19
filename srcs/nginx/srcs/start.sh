#!/bin/sh

# Creating SSL key
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=tpierre/CN=ft_services"
openssl dhparam -dsaparam -out /etc/ssl/certs/dhparam.pem 2048

# service nginx start
telegraf &
nginx -g 'daemon off;'
