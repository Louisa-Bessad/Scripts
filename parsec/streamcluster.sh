#!/bin/sh

cd /benchmarks/streamcluster/
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
./streamcluster 10 20 32 4096 4096 1000 no_input.txt output_streamcluster.txt $1
echo "Job done"
/sbin/m5 exit

