#!/bin/sh

SCHED=dynamic
TH=8

cd /rodinia/bin/
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
for i in {0..9}; do
    echo "Iteration"
    ./hotspot 64 64 1 8 /rodinia/data/hotspot/temp_64 /benchmark/data/hotspot/power_64 ./hotspot.out.10 2>&1 | tee hotspot.log.$TH-$SCHED-$I
done
echo "Job done"
/sbin/m5 exit

