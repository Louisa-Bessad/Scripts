#!/bin/sh

/sbin/m5 checkpoint

cd /parsec-traces
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched at $(date)"
./fluidanimate 8 8 in_35K.fluid
echo "Job done at $(date)"
/sbin/m5 exit

