libvirt:
  pkg.installed

libvirt-python:
  pkg.installed

/etc/conf.d/libvirtd:
  file.managed:
    - source: salt://libvirt/libvirtd

libvirtd:
  service.running

libvirt_keys:
  virt.keys
