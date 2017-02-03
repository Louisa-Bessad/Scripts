#!/bin/sh

/sbin/m5 checkpoint

cd /benchmark/bin/
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
./lud_omp -n 1 -i /benchmark/data/lud/512.dat
echo "Job done"
/sbin/m5 exit

