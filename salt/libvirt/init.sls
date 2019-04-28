libvirt:
  pkg.installed

/etc/conf.d/libvirtd:
  file.managed:
    - source: salt://libvirt/libvirtd

libvirtd:
  service.running
