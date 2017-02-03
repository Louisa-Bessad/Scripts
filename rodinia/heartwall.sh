#!/bin/sh

cd /benchmark/bin/ 
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
./heartwall /benchmark/data/heartwall/test.avi 20 $1
echo "Job done"
/sbin/m5 exit
