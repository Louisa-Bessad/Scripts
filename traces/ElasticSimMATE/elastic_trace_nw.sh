# Script to collect the three types of traces based on checkpoints that already exist
#!/bin/sh

CPU=$1
#KERN=$2
KERN=~/Big_LITTLE/Architectures/binaries/linux-arm-gem5/vmlinux
DTB=$2
#DISK=$4
DISK=~/Big_LITTLE/Architectures/disks/linux-aarch32-ael-traces-nw.img
#DIR=$5
DIR=$3
CHECK=$4
SCRIPT=$5
#SCRIPT=~/Big_LITTLE/Script/traces/appli_test/prout_elasticsimmate.sh
#SCRIPT=~/Big_LITTLE/Script/traces/appli_test/matrix_checkpoint.sh
# SCRIPT=~/Big_LITTLE/Script/traces/appli_test/backprop_X.sh
#CHECK=$7


echo "Started at $(date)"

./build/ARM/gem5.opt -d $DIR configs/example/fs.py --caches \
    -n $CPU --cpu-type arm_detailed --elastic-trace-en --checkpoint-dir=$CHECK -r 1\
    --mem-size=256MB --mem-type SimpleMemory \
    --kernel $KERN --machine-type VExpress_EMM \
    --disk-image $DISK --dtb-filename $DTB \
    --inst-trace-file inst.proto.gz --data-trace-file dep.proto.gz \
    --script $SCRIPT

echo "Finished at $(date)"

