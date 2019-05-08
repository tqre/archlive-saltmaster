# Testing notes on class machines

- qcow images go to root home when executing img_create
- vm_start does not return anything with salt, machines do start

## SSH connection from master -> minion -> virtual machine

- sshd state works on minion
- salt '*' cmd.run 'hostname -i' # useful
- ssh into minion -> another ssh into qemu-machine:
  - ssh localadmin@localhost -p 10022 # works
- direct ssh from master to a vm?

## Starting salt-minion on qemu-vm (LFS-0.3.3)

- sudo salt-minion -l debug
- define master IP address
- qemu has a dhcp server builtin, started default with net nic
- qemu machines need separate ethernet address definition (Archwiki!)
  - net nic option gives default link-level address 52:54:00:12:34:56
  - specify mac with: '-net nic,macaddr=52:54:xx:xx:xx:xx'
- remove masterpki-key from qemu-lfs-minion
- https://wiki.archlinux.org/index.php/QEMU#Networking

#### Manual mac-changing on a 2nd vm-minion on same minion-hypervisor

- this can be accomplished with qemu on vm startup
```
ip link show <interface>
ip link set dev <interface> down
ip link set dev <interface> address xx:xx:xx:xx:xx:xx
ip link set dev <interface> up
```
- dev option needed?
- start up salt-minion on another vm - success

## qemu-LFS networking

- enable ip-forwarding on hypervisor with sysctl
  - sysctl net.ipv4.ip_forward=1
  - interface specific forwarding is possible, but not with systemd-networkd
  - systemd service to make change persistent:
    - https://wiki.archlinux.org/index.php/Internet_sharing

- with ip forwarding enabled on hypervisor, vm can access internet
  - ping doesn't work, only tcp and udp

## Further testing

- multiple qemu-machines, macaddressing?
- class network dhcp space big enough to accomodate 1000+ machines?
- with qemu networking, main server is not even aware of the vms!
- reduce vm memory to 128MB, should be enough

## TODO

- scripts to fire up vm's on minions (done from master?)
  - individual ssh port forwarding for vm's
  - individual link-level addressess for vm's (MAC)
- documentation...


