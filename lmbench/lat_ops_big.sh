#!/bin/sh

cd /lmbench

#taskset 0x10 ./lat_ops 
taskset -c 4 ./lat_ops -N 11

/sbin/m5 exit
