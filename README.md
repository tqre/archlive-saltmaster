# Salt master autoconfig scripts & files
- this repository is cloned with archlive's systemd service on boot
- master_init.sh should be launched manually as root after login
- script copies relevant files to right places
- interface name is read in the init script and appended to /etc/salt/master

## Minionize Ubuntu Server 19.04
- download the script to fresh Ubuntu Server 19.04 and run it
- current environment is VirtualBox with archlive-master running on the same network
