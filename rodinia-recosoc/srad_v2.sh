#!/bin/sh

#SCHED=dynamic
SCHED=static
TH=8

cd /rodinia/bin/

echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"

#for i in {0..9}; do
#./srad_v2 2048 2048 0 127 0 127 $1 0.5 2
echo "Iteration"
#./srad_v2 512 512 0 127 0 127 8 0 1 2>&1 | tee srad_v2.log.$TH-$SCHED-$i
./srad_v2 512 512 0 127 0 127 8 0 1
#done

echo "Job done"
/sbin/m5 exit

