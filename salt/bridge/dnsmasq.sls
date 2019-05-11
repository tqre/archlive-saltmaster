dnsmasq:
  pkg.installed

/etc/dnsmasq.conf:
  file.managed:
    - source: salt://bridge/dnsmasq.conf

dhcp-on-bridge:
  service.running:
    - name: dnsmasq

