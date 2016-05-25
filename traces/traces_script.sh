# Script to collect checkpoint before collect the tree types of traces thanks to this checkpoint and recover with arm_detailed cpu
# For now the synchronization collection is not made to work with atomic
# So collection and restoring are both made with arm_detailed cpu
#!/bin/sh

CPU=$1
KERN=$2
DTB=$3
DISK=$4
DIR=$5
SCRIPT=$6

echo "Started at $(date)"

./build/ARM/gem5.fast -d $DIR configs/example/fs.py --caches --l2cache \
    -n $CPU --cpu-type arm_detailed \
    --mem-size 256MB --mem-type SimpleMemory
    --kernel $KERN --machine-type VExpress_EMM --disk-image $DISK --dtb-filename $DTB --script $SCRIPT

echo "Finished at $(date)"

