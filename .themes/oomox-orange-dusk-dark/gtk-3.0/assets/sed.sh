#!/bin/sh
sed -i \
         -e 's/#12212f/rgb(0%,0%,0%)/g' \
         -e 's/#fff6e6/rgb(100%,100%,100%)/g' \
    -e 's/#0b1726/rgb(50%,0%,0%)/g' \
     -e 's/#e9986d/rgb(0%,50%,0%)/g' \
     -e 's/#17293a/rgb(50%,0%,50%)/g' \
     -e 's/#fff6e6/rgb(0%,0%,50%)/g' \
	"$@"