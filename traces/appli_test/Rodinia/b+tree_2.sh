#!/bin/sh

SCHED=static
TH=2

export OMP_NUM_THREADS=$TH
export OMP_SCHEDULE=$SCHED


/sbin/m5 checkpoint
echo "change directory"
cd /
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"

./b+tree.out core 2 file /rodinia/data/b+tree/mil.txt command /rodinia/data/b+tree/command.txt

echo "Job done"
/sbin/m5 exit

