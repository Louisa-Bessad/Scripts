#!/bin/sh

cd /benchmark/bin/
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
./srad_v2 2048 2048 0 127 0 127 $1 0.5 2
echo "Job done"
/sbin/m5 exit

