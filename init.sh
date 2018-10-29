#!/bin/bash

# https://www.linode.com/docs/security/securing-your-server/

adduser dev
adduser dev sudo

mkdir /home/dev/.ssh
cp authorized_keys /home/dev/.ssh/authorized_keys


# Now check that password loging with ssh is allowd, otherwise enable for the following operation:
# Now locally use 
# ssh-copy-id dev@<ip>
# to copy local SSh key

sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
echo 'AddressFamily inet' | tee -a /etc/ssh/sshd_config

systemctl restart sshd

