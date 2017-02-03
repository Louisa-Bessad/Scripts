#!/bin/sh

cd /lmbench

#taskset 0x1 ./lat_mem_rd -P 1 -N 1 -t 256MB 512
taskset -c 0 ./lat_mem_rd -t 64MB 1024

/sbin/m5 exit

