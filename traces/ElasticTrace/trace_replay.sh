# Script to replay the two types of traces based on the ones collected in the previous phase
#!/bin/sh

CPU=$1
DIR=$2
ITRACE=$3
DTRACE=$4

echo "Started at $(date)"

./build/ARM/gem5.fast -d $DIR configs/example/etrace_replay.py -n $CPU \
    --cpu-type trace --caches \
    --data-trace-file $DTRACE \
    --inst-trace-file $ITRACE \
    --mem-size=4GB

echo "Finished at $(date)"

