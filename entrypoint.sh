#!/bin/bash
# encoding: utf-8

SQUID_USER=squid
SQUID_DIR=/etc/squid

# If certificates/config were not provided, create them here.
if [ ! -d $SQUID_DIR/ssl ]; then
    mkdir $SQUID_DIR/ssl
    openssl req -new -newkey rsa:2048 -nodes -days 3650 -x509 -keyout $SQUID_DIR/ssl/bluestar.pem -out $SQUID_DIR/ssl/bluestar.crt\
	    -subj "/C=US/ST=Texas/L=Austin/O=BlueStar/OU=NetworkSecurity/CN=bluestar"
    openssl x509 -in $SQUID_DIR/ssl/bluestar.crt -outform DER -out $SQUID_DIR/ssl/bluestar.der
fi

if [ -f /var/run/e2guardian.pid ]; then
    rm /var/run/e2guardian.pid
fi

/usr/sbin/e2guardian &
sleep 1
SQUID_EXEC=$(which squid)
exec $SQUID_EXEC -f $SQUID_DIR/squid.conf -NYCd 10
