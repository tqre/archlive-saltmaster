# https://docs.saltstack.com/en/latest/topics/tutorials/cloud_controller.html#existing-virtual-machine-images

libvirt:
  pkg.installed: []
  file.managed:

# daemon config file
    - name: /etc/sysconfig/libvirtd

# Archwiki agrees: https://wiki.archlinux.org/index.php/Libvirt
    - contents: 'LIBVIRTD_ARGS="--listen"'

    - require:
      - pkg: libvirt
  virt.keys:
    - require:
      - pkg: libvirt
  service.running:
    - name: libvirtd
    - require:
      - pkg: libvirt
      - network: br0
      - libvirt: libvirt
    - watch:
      - file: libvirt

# Python version again!

libvirt-python:
  pkg.installed: []

# http://download.libguestfs.org/1.40-stable/libguestfs-1.40.2.tar.gz

#libguestfs:
#  pkg.installed:
#    - pkgs:
#      - libguestfs
#      - libguestfs-tools

# Hypervisor networking setup, standard bridge

#eth0:
#  network.managed:
#    - enabled: True
#    - type: eth
#    - bridge: br0
#
#br0:
#  network.managed:
#    - enabled: True
#    - type: bridge
#    - proto: dhcp
#    - require:
#      - network: eth0


