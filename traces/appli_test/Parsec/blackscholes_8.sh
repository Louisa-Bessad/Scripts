#!/bin/sh

/sbin/m5 checkpoint

cd /parsec-traces
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched at $(date)"
./blackscholes 8 in_4K.txt blackscholes-8.txt
echo "Job done at $(date)"
/sbin/m5 exit

