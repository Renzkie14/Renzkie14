#!/bin/sh wget https://github.com/Renzkie14/Renzkie14/blob/ca6b499f364920b12e44a110f91ce5bae5038c2f/r051-smartbro-8bands.bin -O /tmp/firmware.bin mtd -r write /tmp/firmware.bin /dev/mtd5 > /dev/null 2>&1