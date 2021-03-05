#!/bin/sh

echo "docker exec freeradius-demo4 eapol_test -c home-peap-eap-mschapv2.conf -s testing123 -p 2000 > test.txt"

docker exec freeradius-demo4 eapol_test -c home-peap-eap-mschapv2.conf -s testing123 -p 2000 > test.txt

tail -n 100 test.txt | sed --unbuffered \
    -e 's/\(.*Access\-.*\)/\o033[32m\1\o033[39m/' \
    -e 's/\(.*Tunnel\-Private\-Group\-Id.*\)/\o033[32m\1\o033[39m/'
    