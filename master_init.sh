#!/bin/bash

echo Master initialization script starting...
cp -v /tmp/master/master_config /etc/salt/master
cp -vr /tmp/master/salt /srv
