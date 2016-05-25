# Script to replay the three types of traces based on the ones collected in the previous phase
#!/bin/sh

CPU=$1
# KERN=$2
# DTB=$3
# DISK=$4
DIR=$2
TRACE=$3

# --kernel $KERN --machine-type VExpress_EMM --disk-image $DISK --dtb-filename $DTB \
echo "Started at $(date)"

./build/ARM/gem5.fast -d $DIR configs/example/etrace_replay.py -n $CPU \
    --cpu-type trace --caches \
    --data-trace-file $TRACE \
    --inst-trace-file $TRACE \
    --synchro-trace-file $TRACE \
    --mem-size=4GB

echo "Finished at $(date)"
