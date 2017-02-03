#!/bin/sh

/sbin/m5 checkpoint

cd /parsec-traces
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched at $(date)"
./blackscholes 4 in_4K.txt blackscholes-4.txt
echo "Job done at $(date)"
/sbin/m5 exit

