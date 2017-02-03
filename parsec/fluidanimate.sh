#!/bin/sh

cd /benchmarks/fluidanimate/
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
./fluidanimate $1 8 /benchmarks/fluidanimate/in_35K.fluid
echo "Job done"
/sbin/m5 exit

