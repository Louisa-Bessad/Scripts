#!/bin/sh

SCHED=dynamic
TH=8

cd /benchmark/bin/ 
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
for i in {0..9}; do
    echo "Iteration"
    ./heartwall /rodinia/data/heartwall/test.avi 1 8 2>&1 | tee heartwall.log.$TH-$SCHED-$I
done
echo "Job done"
/sbin/m5 exit
