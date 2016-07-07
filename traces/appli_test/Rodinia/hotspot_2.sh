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

./hotspot 64 64 1 $TH /elastic/data/hotspot/temp_64 /elastic/data/hotspot/power_64 ./hotspot.out.10


echo "Job done"
/sbin/m5 exit

