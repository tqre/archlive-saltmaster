#!/bin/bash

for i in {0..90}; do

/qemu/vm_start /root/$1$i &
sleep 20

done
