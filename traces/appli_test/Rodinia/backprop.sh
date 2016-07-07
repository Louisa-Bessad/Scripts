#!/bin/sh

# /sbin/m5 checkpoint 0 0
# /sbin/m5 checkpoint 1000 2000

SCHED=static
export OMP_SCHEDULE=$SCHED

/sbin/m5 checkpoint
echo "change directory"
cd /
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
./backprop 65536
echo "Jod done"
/sbin/m5 exit

