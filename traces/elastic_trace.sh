# Script to collect the three types of traces based on checkpoints that already exist
#!/bin/sh

CPU=$1
KERN=$2
DTB=$3
DISK=$4
DIR=$5
SCRIPT=$6
CHECK=$7

echo "Started at $(date)"

./build/ARM/gem5.fast -d $DIR configs/example/fs.py --caches \
    -n $CPU --cpu-type arm_detailed --elastic-trace-en --checkpoint-dir=$CHECK -r 1\
    --mem-size=256MB --mem-type SimpleMemory \
    --kernel $KERN --machine-type VExpress_EMM \
    --disk-image $DISK --dtb-filename $DTB \
    --inst-trace-file inst.proto.gz --data-trace-file dep.proto.gz \
    --script $SCRIPT

echo "Finished at $(date)"

