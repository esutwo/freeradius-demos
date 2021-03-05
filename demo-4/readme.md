# FreeRADIUS w/ VLANs

This demo shows how you can assign demos based on proxy or local authentication.

## Build

1. First, copy the `.env-example` to `.env`. Update the values as needed
1. Update the `configs/proxy.conf` and replace `example.com` with your domain
1. Run the following to startup the demo: 
```bash
docker-compose up --build -d
```

## Test

```bash
docker exec freeradius-demo4 eapol_test -c eduroam-peap-eap-mschapv2.conf -s testing123 -p 2000 > test.txt
docker exec freeradius-demo4 eapol_test -c home-peap-eap-mschapv2.conf -s testing123 -p 2000 > test.txt
```