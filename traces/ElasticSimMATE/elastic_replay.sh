# Script to replay the three types of traces based on the ones collected in the previous phase
#!/bin/sh

CPU=$1
# KERN=$2
# DTB=$3
# DISK=$4
DIR=$2
TRACE=$3

# KERN=~/Big_LITTLE/Architectures/binaries/linux-arm-gem5/vmlinux
# DTB=~/Big_LITTLE/Architectures/binaries/linux-arm-gem5/arch/arm/boot/dts/vexpress-v2p-ca15-tc1-gem5_2cpus.dtb
# DISK=~/Big_LITTLE/Architectures/disks/linux-aarch32-ael.img

echo "Started at $(date)"

#--kernel $KERN --machine-type VExpress_EMM --disk-image $DISK --dtb-filename $DTB \

./build/ARM/gem5.fast -d $DIR configs/example/etrace_replay.py -n $CPU \
    --cpu-type trace --caches \
    --data-trace-file $TRACE \
    --inst-trace-file $TRACE \
    --synchro-trace-file $TRACE \
    --mem-size=4GB

echo "Finished at $(date)"

