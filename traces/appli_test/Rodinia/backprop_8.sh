#!/bin/sh

# /sbin/m5 checkpoint 0 0
# /sbin/m5 checkpoint 1000 2000
TH=8
SCHED=static

export OMP_SCHEDULE=$SCHED
export OMP_NUM_THREADS=$TH

/sbin/m5 checkpoint
echo "change directory"
cd /elastic/bin
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
./backprop_8 65536
echo "Jod done"
/sbin/m5 exit

