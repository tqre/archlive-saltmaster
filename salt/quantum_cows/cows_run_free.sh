#!/bin/bash

for i in {0..84}; do

/qemu/vm_start /root/$1$i &
sleep 5

done
