#!/bin/sh

cd /benchmark/bin/
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
./nn /benchmark/data/nn/filelist.txt 5 30 90 $1
echo "Job done"
/sbin/m5 exit

