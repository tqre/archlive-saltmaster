#!/bin/bash

echo Master initialization script starting...

cp -vr /tmp/master/salt /srv

ssh-keygen
cp /root/.ssh/id_rsa.pub /srv/salt/sshd/id_rsa.pub

cat > /etc/salt/master << EOF
interface: 127.0.0.1
EOF

cat > /etc/salt/minion << EOF
master: 127.0.0.1
id: localminion

virt:
  connection:
    uri: qemu:///system

EOF

echo Master IP: $(hostname -i)

echo Starting salt-master service...
systemctl start salt-master

echo Starting local minion...
systemctl start salt-minion

