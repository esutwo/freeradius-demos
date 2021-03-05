FROM ubuntu:latest as build

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install build-essential git libssl-dev devscripts pkg-config libnl-3-dev libnl-genl-3-dev -y && \
    mkdir /build && cd /build && \
    git clone --depth 1 --no-single-branch https://github.com/FreeRADIUS/freeradius-server.git && \
    cd /build/freeradius-server/scripts/ci/ && \
    ./eapol_test-build.sh

FROM freeradius/freeradius-server:3.0.19

COPY --from=build /build/freeradius-server/scripts/ci/eapol_test/eapol_test /usr/local/bin/

COPY configs/ldap /etc/freeradius/mods-enabled/ldap
COPY configs/test-vs.conf /etc/freeradius/sites-enabled/test-vs.conf
COPY configs/proxy.conf /etc/freeradius/proxy.conf

COPY extra/init.sh /usr/local/bin
RUN chmod +x /usr/local/bin/init.sh

ENTRYPOINT ["/usr/local/bin/init.sh"]
CMD ["freeradius"]