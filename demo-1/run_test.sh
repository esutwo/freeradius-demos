#!/bin/sh

echo "docker exec freeradius-demo1 radtest test@example.com password 127.0.0.1:2000 10 testing123"

docker exec freeradius-demo1 radtest test@example.com password 127.0.0.1:2000 10 testing123