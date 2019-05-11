#!/bin/bash
ip link add name br0 type bridge
ip addr add dev br0 10.0.10.1/24
ip link set br0 up

