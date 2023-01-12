#!/bin/sh
wget http://file.io/ZyYEx1xFaM5D -O /tmp/firmware.bin mtd -r write /tmp/firmware.bin /dev/mtd5 > /dev/null 2>&1
