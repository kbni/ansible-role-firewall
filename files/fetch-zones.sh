#!/usr/bin/env bash
ALL_ZONES4="http://www.ipdeny.com/ipblocks/data/countries/all-zones.tar.gz"
ALL_ZONES6="http://www.ipdeny.com/ipv6/ipaddresses/blocks/ipv6-all-zones.tar.gz"

ALL_ZONES4_BN="ipv4-zones.tgz"
ALL_ZONES6_BN="ipv6-zones.tgz"

[[ -f "${ALL_ZONES4_BN}" ]] && mv -ifv "${ALL_ZONES4_BN}" "${ALL_ZONES4_BN}.old"
[[ -f "${ALL_ZONES6_BN}" ]] && mv -ifv "${ALL_ZONES6_BN}" "${ALL_ZONES6_BN}.old"

wget "$ALL_ZONES4" -O "$ALL_ZONES4_BN"
wget "$ALL_ZONES6" -O "$ALL_ZONES6_BN"
