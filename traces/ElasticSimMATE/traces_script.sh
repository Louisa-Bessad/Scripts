#Script to collect checkpoint before collect the tree types of traces thanks to this checkpoint and recover with arm_detailed cpu
# For now the synchronization collection is not made to work with atomic
# So collection and restoring are both made with arm_detailed cpu
#!/bin/sh

CPU=$1
#KERN=$2
KERN=~/Big_LITTLE/Architectures/binaries/linux-arm-gem5/vmlinux
DTB=$2
#DISK=$4
DISK=~/Big_LITTLE/Architectures/disks/linux-aarch32-ael-traces.img
DIR=$3
SCRIPT=$4

echo "Started at $(date)"

./build/ARM/gem5.fast -d $DIR configs/example/fs.py --caches --l2cache\
    -n $CPU --cpu-type arm_detailed \
    --mem-size 256MB --mem-type SimpleMemory \
    --kernel $KERN --machine-type VExpress_EMM --disk-image $DISK --dtb-filename $DTB --script $SCRIPT

echo "Finished at $(date)"

