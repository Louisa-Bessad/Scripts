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

./srad_v1 100 0.5 502 458 $TH /elastic/data/srad/image.pgm

echo "Job done"
/sbin/m5 exit

