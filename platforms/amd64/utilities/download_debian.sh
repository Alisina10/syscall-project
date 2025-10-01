#!/usr/bin/env sh

DEBIAN='debian-13.1.0-amd64-netinst.iso'
URL="https://www.dropbox.com/scl/fi/knyrl5853tvg57yfivb8a/$DEBIAN?rlkey=xx34yfv5b3pbixndzkwjfhln8&dl=1"

curl --location -C - --output "$DEBIAN" "$URL"
