mysql-server:
  pkg.installed

/etc/mysql/my.cnf:
  file.managed:
    - source: salt://ubuntuserver/mysql/my.cnf

mysql:
  service.running:
    - watch:
      - file: /etc/mysql/my.cnf

