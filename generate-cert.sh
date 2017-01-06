#!/bin/sh

# Country Name (2 letter code) [XX]:cn
# State or Province Name (full name) []:js
# Locality Name (eg, city) [Default City]:nj
# Organization Name (eg, company) [Default Company Ltd]:linker
# Organizational Unit Name (eg, section) []:rd
# Common Name (eg, your name or your server's hostname) []:192.168.10.187
# Email Address []:zyfdegg@gmail.com

openssl req -newkey rsa:2048 -nodes -sha256 -keyout ssl/server.key -x509 -days 365 -out ssl/server.pem

# Country Name (2 letter code) [XX]:cn
# State or Province Name (full name) []:js
# Locality Name (eg, city) [Default City]:nj
# Organization Name (eg, company) [Default Company Ltd]:linker
# Organizational Unit Name (eg, section) []:rd
# Common Name (eg, your name or your server's hostname) []:192.168.10.187
# Email Address []:zyfdegg@gmail.com
openssl req -newkey rsa:2048 -nodes -sha256 -keyout ssl/registry.key -x509 -days 365 -out ssl/registry.pem
