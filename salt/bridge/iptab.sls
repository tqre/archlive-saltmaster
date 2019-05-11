iptables:
  pkg.installed

natrule:
  iptables.append:
    - table: nat
    - chain: POSTROUTING
    - o: enp0s3
    - jump: MASQUERADE
    - save: True

conntrack-forward:
  iptables.append:
    - chain: FORWARD
    - m: conntrack
    - ctstate: RELATED,ESTABLISHED
    - jump: ACCEPT
    - save: True

forward-from-bridge:
  iptables.append:
    - chain: FORWARD
    - i: br0
    - o: enp0s3
    - jump: ACCEPT
    - save: True

iptables-service:
  service.running:
    - name: iptables

