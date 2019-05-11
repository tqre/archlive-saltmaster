create-bridge:
  cmd.script:
    - source: salt://bridge/create_bridge.sh

include:
  - bridge.dnsmasq
  - bridge.iptab
  - bridge.ipforward

