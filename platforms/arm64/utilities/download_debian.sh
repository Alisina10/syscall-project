#!/usr/bin/env sh

DEBIAN='debian-13.1.0-arm64-netinst.iso'
URL="https://www.dropbox.com/scl/fi/uc0w2ru519tsdmq18957k/$DEBIAN?rlkey=p5f0tvpe94o0m3v54ks22jppq&dl=1"
curl --location -C - --output "$DEBIAN" "$URL"
