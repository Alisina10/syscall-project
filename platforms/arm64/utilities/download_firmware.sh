#!/usr/bin/env sh

FIRMWARE_ARCHIVE='firmware-arm64.tar.gz'
EFI_FIRMWARE_CODE='AAVMF_CODE.fd'
EFI_FIRMWARE_VARS='AAVMF_VARS.fd'
LINUX_KERNEL='vmlinuz'
LINUX_RAMDISK='initrd.gz'

URL="https://www.dropbox.com/scl/fi/qn44feqdw0zr3twcbd96o/$FIRMWARE_ARCHIVE?rlkey=1ci5wuxktia2lr2keo1lcr8nb&dl=1"
curl --location -C - --output "$FIRMWARE_ARCHIVE" "$URL"

test -e "$EFI_FIRMWARE_CODE" && mv "$EFI_FIRMWARE_CODE" "$EFI_FIRMWARE_CODE".old
test -e "$EFI_FIRMWARE_VARS" && mv "$EFI_FIRMWARE_VARS" "$EFI_FIRMWARE_VARS".old
test -e "$LINUX_KERNEL"  && mv "$LINUX_KERNEL"  "$LINUX_KERNEL".old
test -e "$LINUX_RAMDISK" && mv "$LINUX_RAMDISK" "$LINUX_RAMDISK".old
tar -xvzf "$FIRMWARE_ARCHIVE"
