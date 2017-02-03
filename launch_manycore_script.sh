#!/bin/sh

if [ $# -ne 7 ]
then 
    echo "You should have 6 arguments and you have `$#` arguments"
    echo "Scrit usage nb_cores kernel dtb disk-image output"
    echo "You can use VExpre_EMM* machine-type with linux-arm*-gem5/vmlinux"
    echo "or"
    echo "You can use VExpre_GEM5_V1 machine-type with linux_*bits/vmlinux"
    exit
else
echo "Started at $(date)"
./build/ARM/gem5.opt -d $7 configs/example/fs.py -n $1 --machine-type $4 --kernel $2 --dtb-filename $3 --disk-image $5 --script $6 --caches --l2cache --mem-size 256MB --mem-type LPDDR3_1600_x32
echo "Finished at: $(date)"
fi
