#This script is supposed to do the same than traces_script.sh 
#!/bin/sh

CPU=$1
TYPE=$2
KERN=$3
DTB=$4
DISK=$5
DIR=$6

echo "Started at $(date)"

./build/ARM/gem5.fast -d $DIR configs/example/fs.py --caches --l2cache \
    -n $CPU --cpu-type $TYPE \
    --mem-size=256MB --mem-type LPDDR3_1600_x32 \
    --kernel $KERN --machine-type VExpress_EMM --disk-image $DISK --dtb-filename $DTB

echo "Finished at $(date)"

