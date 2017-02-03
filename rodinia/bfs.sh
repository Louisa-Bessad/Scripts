#!/bin/sh

cd /benchmark/bin/ 
echo "Reset stats and start $(basename $0 .rcS)"
/sbin/m5 resetstats
echo "Job launched"
./bfs $1 /benchmark/data/bfs/graph1MW_6.txt
echo "Job done"
/sbin/m5 exit

