#!/bin/sh

/sbin/m5 checkpoint

cd /parsec-gem5
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched at $(date)"
./swaptions -ns 16 -sm 10000 -nt 1
echo "Job done at $(date)"
/sbin/m5 exit

