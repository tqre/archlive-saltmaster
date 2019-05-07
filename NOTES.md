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




