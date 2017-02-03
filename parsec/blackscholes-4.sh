#!/bin/sh

cd /benchmarks/blackscholes/
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
./blackscholes 4 in_4K.txt blackscholes-4.txt
echo "Job done"
/sbin/m5 exit

