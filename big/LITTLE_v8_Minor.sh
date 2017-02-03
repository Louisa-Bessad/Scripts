#!/bin/sh

NB=$1
# KERN=$3
KERN=~/Big_LITTLE/Architectures/binaries/linux-arm64-gem5/vmlinux
# MACHINE=$4
MACHINE=VExpress_EMM64
MEMORY=$2
DTB=$3
# DISK=$7
DISK=~/Big_LITTLE/Architectures/disks/linaro-minimal-aarch64.img
SCRIPT=$4
DIR=$5

# if [$# -ne 8]
# then
#     echo "Script usage nb_big nb_little arch machine-type dtb_file disk-image dir"
#     echo "You can use VExpress_EMM* machine-type with linux-arm*-gem5/vmlinux"
#     echo "or"
#     echo "You can use VExpress_GEM5_V1 machine-type with manycore_*bits/vmlinux"
#     exit
# else
echo "Started at $(date)"
./build/ARM/gem5.fast -d $DIR configs/example/fs.py --caches --l2cache \
		      -n $NB --cpu-type=MinorCPU \
		      --cpu-clock=1.5GHz \
		      --mem-size=256MB --mem-type=$MEMORY \
		      --kernel $KERN --machine-type $MACHINE --disk-image $DISK \
		      --dtb-filename $DTB --script $SCRIPT
		      # --l1d_size=32kB --l1i_size=32kB \
		      # --l1d_assoc=4 --l1i_assoc=2 \
		      # --l2_size=256kB --l2_assoc=16 \
echo "Finished at $(date)"
# fi
