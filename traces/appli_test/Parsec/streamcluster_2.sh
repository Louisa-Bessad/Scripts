#!/bin/sh

/sbin/m5 checkpoint

cd /parsec-traces
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched at $(date)"
./streamcluster 10 20 32 4096 4096 1000 no_input.txt output_streamcluster.txt 2
echo "Job done at $(date)"
/sbin/m5 exit

