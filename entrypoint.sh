#!/bin/sh -e

mkdir /var/drydock

mkdir ~/.ssh
echo -e "Host *\nStrictHostKeyChecking no" > ~/.ssh/config
echo -e "$AUTHORIZED_KEYS" > ~/.ssh/authorized_keys
echo -e "$PRIVATE_KEY" > ~/.ssh/id_rsa
chmod -R 600 ~/.ssh
/usr/sbin/sshd -D -f /etc/ssh/sshd_config
