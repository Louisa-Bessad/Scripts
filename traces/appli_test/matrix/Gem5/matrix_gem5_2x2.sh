#!/bin/sh

# /sbin/m5 checkpoint 0 0
# /sbin/m5 checkpoint 1000 2000

/sbin/m5 checkpoint
echo "change directory"
cd /
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched at $(date)"
./matrix_gem5_2x2
echo "Jod done at $(date)"
/sbin/m5 exit

