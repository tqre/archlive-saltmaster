#!/bin/bash

echo Master initialization script starting...
cp -vr /tmp/master/salt /srv

cat > /etc/salt/master << EOF
interface: $(hostname -i)
EOF

echo Master IP: $(hostname -i)
echo Starting salt-master service...
systemctl start salt-master
