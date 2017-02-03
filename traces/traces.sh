#This script is supposed to do the same than traces_script.sh 
#!/bin/sh

CPU=$1
# KERN=$3
KERN=~/Big_LITTLE/Architectures/binaries/linux-arm-gem5/vmlinux
DTB=$2
# DISK=$5
DISK=~/Big_LITTLE/Architectures/disks/linux-aarch32-ael-traces.img
DIR=$3

echo "Started at $(date)"

./build/ARM/gem5.opt -d $DIR configs/example/fs.py --caches --l2cache \
    -n $CPU --cpu-type arm_detailed \
    --mem-size=256MB --mem-type SimpleMemory \
    --kernel $KERN --machine-type VExpress_EMM --disk-image $DISK --dtb-filename $DTB

echo "Finished at $(date)"

