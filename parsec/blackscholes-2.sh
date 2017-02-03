#!/bin/sh

/sbin/m5 checkpoint

cd /benchmarks/blackscholes/
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
./blackscholes 2 in_4K.txt blackscholes-2.txt
echo "Job done"
/sbin/m5 exit

