#Script to execute gem5 FS simulation and compare results with ElasticTrace and ElasticSimMATE
#!/bin/sh

CPU=$1
#KERN=$2
KERN=~/Big_LITTLE/Architectures/binaries/linux-arm-gem5/vmlinux
DTB=$2
#DISK=$4
DISK=~/Big_LITTLE/Architectures/disks/linux-aarch32-ael-traces.img
#DIR=$5
DIR=$3
SCRIPT=$4

echo "Started at $(date)"

./build/ARM/gem5.opt -d $DIR configs/example/fs.py --caches \
    -n $CPU --cpu-type arm_detailed \
    --mem-size=256MB --mem-type SimpleMemory \
    --kernel $KERN --machine-type VExpress_EMM \
    --disk-image $DISK --dtb-filename $DTB \
    --script $SCRIPT

echo "Finished at $(date)"
