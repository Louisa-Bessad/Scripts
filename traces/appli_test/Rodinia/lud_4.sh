#!/bin/sh

SCHED=static
TH=4

export OMP_NUM_THREADS=$TH
export OMP_SCHEDULE=$SCHED


/sbin/m5 checkpoint
echo "change directory"
cd /elastic/bin
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"

./lud_omp -v -n $TH -s 256

echo "Job done"
/sbin/m5 exit

