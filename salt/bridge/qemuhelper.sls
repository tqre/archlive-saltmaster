/etc/qemu/bridge.conf:
  - file.managed:
    - source: salt://bridge/qhelper.conf
    - makedirs: True
