#!/bin/sh

cd /benchmark/bin/
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
./hotspot 512 512 2 $1 /benchmark/data/hotspot/temp_512 /benchmark/data/hotspot/power_512
echo "Job done"
/sbin/m5 exit

