ufw:
  pkg.installed

/etc/ufw:
  file.recurse:
    - source: salt://ufw/config

