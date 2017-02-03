#!/bin/sh

cd /lmbench

#taskset 0x10 ./stream 
taskset -c 4 ./stream -M 2000000

/sbin/m5 exit
