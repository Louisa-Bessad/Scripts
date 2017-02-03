#!/bin/sh

cd /lmbench

#taskset 0x01 ./lat_ops
taskset -c 0 ./lat_ops -N 11

/sbin/m5 exit
