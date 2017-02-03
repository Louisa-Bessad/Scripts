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

echo "Started at $(date)"
./build/ARM/gem5.fast -d $DIR configs/example/fs.py --caches --l2cache \
		      --cpu-type=A57 -n $NB \
		      --cpu-clock=2.1GHz \
		      --l1d_size=32kB --l1i_size=48kB \
		      --l1d_assoc=2 --l1i_assoc=3 \
		      --l2_size=2MB --l2_assoc=16 \
		      --mem-size=256MB --mem-type=$MEMORY \
		      --kernel $KERN --machine-type $MACHINE --disk-image $DISK \
		      --dtb-filename $DTB --script $SCRIPT
echo "Finished at $(date)"

