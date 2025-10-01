#!/usr/bin/env sh

export PATH=$PATH:`cd ../../qemu > /dev/null 2>&1 || cd ../../../qemu > /dev/null 2>&1; pwd` 

DISK='debian-13.1.0-amd64-hd.qcow2'
SIZE='10G'

test -e "$DISK" && mv "$DISK" "$DISK".old
qemu-img create -f qcow2 "$DISK" "$SIZE"
