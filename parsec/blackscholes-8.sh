#!/bin/sh

cd /benchmarks/blackscholes/
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
./blackscholes 8 in_4K.txt blackscholes-8.txt
echo "Job done"
/sbin/m5 exit

