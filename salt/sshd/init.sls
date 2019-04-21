openssh:
  pkg.installed

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://sshd_config

/root/.ssh/authorized_keys:
  file.managed:
    - source: salt://sshd/id_rsa.pub
    - makedirs: True

sshd:
  service.running:
    - watch:
      - file: /etc/ssh/sshd_config
      - file: /root/.ssh/authorized_keys

