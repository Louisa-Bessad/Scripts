#!/bin/sh

cd /benchmarks/blackscholes/
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
./blackscholes 16 in_4K.txt blackscholes-16.txt
echo "Job done"
/sbin/m5 exit

