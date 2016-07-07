#!/bin/sh

SCHED=static
TH=8

export OMP_NUM_THREADS=$TH
export OMP_SCHEDULE=$SCHED


/sbin/m5 checkpoint
echo "change directory"
cd /
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"

./heartwall /rodinia/data/heartwall/test.avi 1 $TH


echo "Job done"
/sbin/m5 exit

