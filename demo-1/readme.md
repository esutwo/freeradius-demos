# FreeRADIUS w/ Google LDAP Demo

This demo shows how to authenticate to Google using an LDAP backend.

## Build

1. Get your Google Secure LDAP certificate, and place it in the certs directory. Ensure to following the naming scheme of `ldap-client.crt` and `ldap-client.key`
1. Update the credentials located in `configs/ldap`
1. Update the `configs/proxy.conf` and replace `example.com` with your domain
1. Run the following to startup the demo: 
```bash
docker-compose up --build -d
```

## Test

```bash
docker exec freeradius-demo1 radtest test@example.com password 127.0.0.1:2000 10 testing123
```
