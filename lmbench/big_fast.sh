#!/bin/sh

NBB=$1
NBL=$2
# KERN=$3
KERN=~/Big_LITTLE/Architectures/binaries/linux-arm64-gem5/vmlinux
# MACHINE=$4
MACHINE=VExpress_EMM64
MEMORY=$3
DTB=$4
# DISK=$7
DISK=~/Big_LITTLE/Architectures/disks/linaro-minimal-aarch64.img
SCRIPT=$5
DIR=$6

# if [$# -ne 8]
# then
#     echo "Script usage nb_big nb_little arch machine-type dtb_file disk-image dir"
#     echo "You can use VExpress_EMM* machine-type with linux-arm*-gem5/vmlinux"
#     echo "or"
#     echo "You can use VExpress_GEM5_V1 machine-type with manycore_*bits/vmlinux"
#     exit
# else
echo "Started at $(date)"
./build/ARM/gem5.fast -d $DIR configs/example/fs.py --caches --l2cache --big-little \
    --cpu-type-big=A57 --cpu-type-little=A53 \
    --cpu-clock-big=2.1GHz --cpu-clock-little=1.5GHz \
    --num-cpus-big=$1 --num-cpus-little=$2 \
    --l1d_size_big=32kB --l1i_size_big=48kB \
    --l1d_assoc_big=2 --l1i_assoc_big=3 \
    --l1d_size_little=32kB --l1i_size_little=32kB \
    --l1d_assoc_little=4 --l1i_assoc_little=2 \
    --l2_size_big=2MB --l2_assoc_big=16 \
    --l2_size_little=256kB --l2_assoc_little=16 \
    --mem-size=256MB --mem-type=$MEMORY \
    --kernel $KERN --machine-type $MACHINE --disk-image $DISK --dtb-filename $DTB --script $SCRIPT
    echo "Finished at $(date)"
# fi
