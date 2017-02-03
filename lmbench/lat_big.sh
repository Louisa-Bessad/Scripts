#!/bin/sh

cd /lmbench

#taskset 0x10 ./lat_mem_rd -P 1 -N 1 -t 256MB 512
taskset -c 4 ./lat_mem_rd -t 64MB 1024

/sbin/m5 exit
