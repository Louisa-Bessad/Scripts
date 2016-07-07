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

#./srad_v2 2048 2048 0 127 0 127 $1 0.5 2
./srad_v2 512 512 0 127 0 127 $TH 0 1

echo "Job done"
/sbin/m5 exit

