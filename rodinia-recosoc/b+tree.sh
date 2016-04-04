#!/bin/sh

SCHED=dynamic
TH=8

cd /rodinia/bin/ 
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
for i in {0..9}; do
    echo "Iteration"
    ./b+tree.out core 2 file /rodinia/data/mil.txt command /rodinia/data/command.txt 2>&1 b+tree.out.log.$TH-$SCHED-$i
done
echo "Job done"
/sbin/m5 exit

