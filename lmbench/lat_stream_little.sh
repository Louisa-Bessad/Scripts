#!/bin/sh

cd /lmbench

#taskset 0x01 ./stream
taskset -c 0 ./stream -M 2000000

/sbin/m5 exit
