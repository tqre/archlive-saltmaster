libvirt:
  pkg.installed

libvirt-python:
  pkg.installed

/etc/conf.d/libvirtd:
  file.managed:
    - source: salt://libvirt/libvirtd

libvirtd:
  service.running

eth0:
  network.managed:
    - enabled: True
    - type: eth
    - bridge: br0

br0:
  network.managed:
    - enabled: True
    - type: bridge
    - proto: dhcp
    - require:
      - network: eth0

libvirt_keys:
  virt.keys
