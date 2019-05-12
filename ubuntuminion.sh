#!/bin/bash

# This script makes a salt-minion out of Ubuntu-Server 19.04
apt-get install salt-minion
cat > /etc/salt/minion << EOF
master: 10.0.2.4
EOF
systemctl restart salt-minion
