# FreeRADIUS w/ Eduroam

This lab shows how to handle the connection up to eduroam.

## Build

1. First, copy the `.env-example` to `.env`. Update the values as needed
1. Update the `configs/proxy.conf` and replace update with your eduroam secret with your domain
1. Update the `configs/proxy.conf` and replace `example.com` with your domain
1. Run the following to startup the demo: 
```bash
docker-compose up --build -d
```

## Test

```bash
docker exec freeradius-demo3 eapol_test -c peap-eap-mschapv2.conf -s testing123 -p 2000 > test.txt
```