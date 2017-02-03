*#!/bin/sh

cd /benchmark/bin/
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
./srad_v1 100 0.5 502 458 $1 /benchmark/data/srad/image.pgm
echo "Job done"
/sbin/m5 exit

