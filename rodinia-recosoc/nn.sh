#!/bin/sh

SCHED=dynamic
TH=8

cd /rodinia/bin/
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
for i in {0..9}; do 
    echo "Iteration"
    ./nn filelist.txt 42760 30 90 2>&1 | tee nn.log.$TH-$SCHED-$i
done
echo "Job done"
/sbin/m5 exit

