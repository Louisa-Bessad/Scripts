#!/bin/sh

cd /benchmark/bin/
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job done"
./needle 2048 10 $1
echo "Job launched"
/sbin/m5 exit

