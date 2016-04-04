*#!/bin/sh

SCHED=dynamic
TH=8

cd /rodinia/bin/
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
for i in {0..9}; do
    echo "Iteration"
    ./srad_v1 1 1 502 458 8 2>&1 | tee srad_v1.log.$TH-$SCHED-$I
done
echo "Job done"
/sbin/m5 exit

