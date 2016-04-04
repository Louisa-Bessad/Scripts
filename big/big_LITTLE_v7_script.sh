#!/bin/sh

NBB=$1
NBL=$2
ARCH=$3
MACHINE=$4
DTB=$5
DISK=$6
SCRIPT=$7
DIR=$8

if [ $# -ne 7 ]
 then
    echo $#
    echo "Script usage nb_big nb_little arch machine-type dtb_file disk-image dir"
    echo "You can use VExpress_EMM* machine-type with linux-arm*-gem5/vmlinux"
    echo "or"
    echo "You can use VExpress_GEM5_V1 machine-type with manyxore_*bits/vmlinux"
    exit
else
echo "Started at $(date)"
./build/ARM/gem5.opt -d $DIR \
    configs/example/fs.py \
    --caches --l2cache --big-little \
    --cpu-type-big=A15 --cpu-type-little=A7 \
    --cpu-clock-big=2GHz --cpu-clock-little=1.4GHz \
    --num-cpus-big=$NBB --num-cpus-little=$NBL \
    --l1d_size_big=32kB --l1i_size_big=32kB \
    --l1d_assoc_big=2 --l1i_assoc_big=2 \
    --l1d_size_little=32kB --l1i_size_little=32kB \
    --l1d_assoc_little=2 --l1i_assoc_little=2 \
    --l2_size_big=2MB --l2_assoc_big=16 \
    --l2_size_little=512kB --l2_assoc_little=8 \
    --mem-size=256MB --mem-type=LPDDR3_1600_x32 \
    --kernel $ARCH --machine-type=$MACHINE --disk-image $DISK --dtb-filename $DTB \
    --script $SCRIPT
echo "Finished at $(date)"
fi
