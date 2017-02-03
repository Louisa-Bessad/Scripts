#!/bin/sh

# /sbin/m5 checkpoint 0 0
# /sbin/m5 checkpoint 1000 2000

/sbin/m5 checkpoint

cd /benchmark/bin/ 
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
./backprop 65535 4
echo "Job done"
/sbin/m5 exit

