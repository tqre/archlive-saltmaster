ufw:
  pkg.installed

/etc/ufw:
  file.recurse:
    - source: salt://ufw/config
    - watch_in:
      - service: ufw

firewall:
  service.running:
    - name: ufw

'ufw enable':
  cmd.run
