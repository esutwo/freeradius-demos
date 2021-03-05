#!/bin/sh

echo "docker exec freeradius-demo3 eapol_test -c peap-eap-mschapv2.conf -s testing123 -p 2000 > test.txt"

docker exec freeradius-demo3 eapol_test -c peap-eap-mschapv2.conf -s testing123 -p 2000 > test.txt

tail -n 100 test.txt | sed --unbuffered \
    -e 's/\(.*Access\-.*\)/\o033[32m\1\o033[39m/'