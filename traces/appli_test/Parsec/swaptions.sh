#!/bin/sh

cd /benchmarks/swaptions
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
./swaptions -ns 16 -sm 10000 -nt $1
echo "Job done"
/sbin/m5 exit

