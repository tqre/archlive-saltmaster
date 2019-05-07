# Testing notes on class machines

- qcow images go to root home when executing img_create
- vm_start does not return anything with salt, machines do start

## SSH connection from master -> minion -> virtual machine

- sshd state works on minion
- salt '*' cmd.run 'hostname -i' # useful
- ssh into minion -> another ssh into qemu-machine:
  - ssh localadmin@localhost -p 10022 # works

## Starting salt-minion on qemu-vm (LFS-0.3.3)

- sudo salt-minion -l info &   # process in background
- define master IP address
- qemu defines enp0s2 to 10.0.2.15 by default, change that
- qemu machines ethernet address definition (Archwiki!)
  - net nic option gives default link-level address 52:54:00:12:34:56
  - specify mac with: '-net nic,macaddr=52:54:xx:xx:xx:xx'

## qemu-LFS networking

- enable ip-forwarding on hypervisor with sysctl
  - sysctl net.ipv4.ip_forward=1
  - interface specific forwarding is possible, but not with systemd-networkd
  - systemd service to make change persistent:
    - https://wiki.archlinux.org/index.php/Internet_sharing

- with ip forwarding enabled on hypervisor, vm can access internet
  - ping doesn't work, only tcp and udp

- tap device?


