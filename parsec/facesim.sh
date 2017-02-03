#!/bin/sh

cd /benchmarks/facesim/ 
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
./facesim -threads $1
echo "Job done"
/sbin/m5 exit

