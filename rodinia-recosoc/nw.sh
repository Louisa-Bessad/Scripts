#!/bin/sh

SCHED=dynamic
TH=8

cd /rodinia/bin/
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
for i in {0..9}; do
    echo "Iteration"
    ./needle 1024 0 8 2>&1 | tee needle.log.$TH-$SCHED-$I
done
echo "Job launched"
/sbin/m5 exit

