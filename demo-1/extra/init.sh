#!/bin/bash

set -e
set -x
echo "$@"

# Handle the certs
if test -v LDAP_CERTS; then
	cp /certs/ldap-client.key /etc/freeradius/certs/ldap-client.key
	cp /certs/ldap-client.crt /etc/freeradius/certs/ldap-client.crt
	chown freerad:freerad /etc/freeradius/certs/ldap-client*
	chmod 640 /etc/freeradius/certs/ldap-client*
	sed -i '/#.*certificate_file/s/^#//g' /etc/freeradius/mods-available/ldap
	sed -i '/#.*private_key_file/s/^#//g' /etc/freeradius/mods-available/ldap
fi

# Handle the rest of the certificates
# First the array of files which need 640 permissions
FILES_640=( "ca.key" "server.key" "server.p12" "server.pem" "ldap-client.crt" "ldap-client.key" )
for i in "${FILES_640[@]}"
do
	if [ -f "/certs/$i" ]; then
	    cp /certs/$i /etc/raddb/certs/$i
	    chmod 640 /etc/raddb/certs/$i
	fi
done

# Now all files that need a 644 permission set
FILES_644=( "ca.pem" "server.crt" "server.csr" "dh" )
for i in "${FILES_644[@]}"
do
	if [ -f "/certs/$i" ]; then
	    cp /certs/$i /etc/raddb/certs/$i
	    chmod 644 /etc/raddb/certs/$i
	fi
done

/docker-entrypoint.sh "$@"
