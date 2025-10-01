#!/usr/bin/env sh

FIRMWARE_ARCHIVE='firmware-amd64.tar.gz'
EFI_FIRMWARE_CODE='OVMF_CODE_4M.fd'
EFI_FIRMWARE_VARS='OVMF_VARS_4M.fd'
LINUX_KERNEL='vmlinuz'
LINUX_RAMDISK='initrd.gz'

URL="https://www.dropbox.com/scl/fi/8q08klmov0ljp3ys4324y/$FIRMWARE_ARCHIVE?rlkey=tcklsfcft1v62hdgsdj5gxww3&dl=1"
curl --location -C - --output "$FIRMWARE_ARCHIVE" "$URL"

test -e "$EFI_FIRMWARE_CODE" && mv "$EFI_FIRMWARE_CODE" "$EFI_FIRMWARE_CODE".old
test -e "$EFI_FIRMWARE_VARS" && mv "$EFI_FIRMWARE_VARS" "$EFI_FIRMWARE_VARS".old
test -e "$LINUX_KERNEL"  && mv "$LINUX_KERNEL"  "$LINUX_KERNEL".old
test -e "$LINUX_RAMDISK" && mv "$LINUX_RAMDISK" "$LINUX_RAMDISK".old
tar -xvzf "$FIRMWARE_ARCHIVE"
