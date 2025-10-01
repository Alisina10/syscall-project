#!/usr/bin/env sh

QEMU_ARCHIVE='qemu-10.1.0-win64.tar.gz'
QEMU_DIRECTORY='qemu'
URL="https://www.dropbox.com/scl/fi/17ezrngro9dk8rfxmqyf9/$QEMU_ARCHIVE?rlkey=u7rdwyuwwpwadww1jntap5d6g&dl=1"
curl --location -C - --output "$QEMU_ARCHIVE" "$URL"

test -e "$QEMU_DIRECTORY" && mv "$QEMU_DIRECTORY" "$QEMU_DIRECTORY"_old
mkdir "$QEMU_DIRECTORY" && tar -xvzf "$QEMU_ARCHIVE" -C "$QEMU_DIRECTORY" --strip-components 1
