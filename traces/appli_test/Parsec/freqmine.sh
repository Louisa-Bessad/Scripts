#!/bin/sh

cd /benchmarks/freqmine/
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
./freqmine /benchmarks/freqmine/kosarak_250k.dat 220
echo "Job done"
/sbin/m5 exit

