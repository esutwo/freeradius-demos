# FreeRADIUS w/ Active Directory Demo

This demo shows how to authenticate to an AD backend using MS-CHAPv2.

## Build

1. First, copy the `.env-example` to `.env`. Update the values as needed
1. Update the `configs/proxy.conf` and replace `example.com` with your domain
1. Run the following to startup the demo: 
```bash
docker-compose up --build -d
```

## Test

```bash
docker exec freeradius-demo2 eapol_test -c peap-eap-mschapv2.conf -s testing123 -p 2000 > test.txt
```