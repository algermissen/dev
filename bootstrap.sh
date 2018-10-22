#!/bin/bash

# https://www.linode.com/docs/security/securing-your-server/

adduser dev
adduser dev sudo

# Now check that password loging with ssh is allowd, otherwise enable for the following operation:
# Now locally use 
# ssh-copy-id dev@<ip>
# to copy local SSh key

sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
echo 'AddressFamily inet' | sudo tee -a /etc/ssh/sshd_config

sudo systemctl restart sshd

# Then do
# sudo ss -atpu


sudo apt-get update && sudo apt-get upgrade
sudo apt-get install ufw



sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
sudo cp vimrc ~/.vimrc

curl https://sh.rustup.rs -sSf | sh

source $HOME/.cargo/env

rustup component add rust-src
rustup component add rust-docs

rustup update

rustup toolchain install nightly

#wget https://linux.dropbox.com/packages/ubuntu/dropbox_2015.10.28_amd64.deb
#sudo apt-get install ./dropbox_2015.10.28_amd64.deb

sudo apt-get install mosh
sudo apt-get install gcc

sudo ufw allow proto udp to any port 60001:60010




