#!/bin/sh

SCHED=static
TH=8

export OMP_NUM_THREADS=$TH
export OMP_SCHEDULE=$SCHED


/sbin/m5 checkpoint
echo "change directory"
cd /elastic/bin
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"

./nn /elastic/data/nn/filelist.txt 5 30 90 $TH

echo "Job done"
/sbin/m5 exit

