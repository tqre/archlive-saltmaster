#!/bin/bash

echo Master initialization script starting...

cp -vr /tmp/master/salt /srv

ssh-keygen
cp /root/.ssh/id_rsa.pub /srv/salt/sshd/id_rsa.pub

cat > /etc/salt/master << EOF
interface: $(hostname -i)
worker_threads: 20
EOF

echo Master IP: $(hostname -i)

echo Starting salt-master service...
systemctl start salt-master
