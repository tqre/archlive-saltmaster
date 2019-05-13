#!/bin/bash

for i in {0..9}; do

/qemu/vm_start /root/vm_start COW$i &

done
