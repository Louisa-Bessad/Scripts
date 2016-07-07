#!/bin/sh

SCHED=static
TH=2

export OMP_NUM_THREADS=$TH
export OMP_SCHEDULE=$SCHED


/sbin/m5 checkpoint
echo "change directory"
cd /elastic/bin
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"

./needle 1024 10 $TH

echo "Job done"
/sbin/m5 exit

