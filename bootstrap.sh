#!/bin/bash

# https://www.linode.com/docs/security/securing-your-server/

ss -atpu

apt-get update 

apt-get install ufw

ufw default allow outgoing
ufw default deny incoming
ufw allow ssh
ufw allow proto udp to any port 60001:60010
ufw logging on
ufw status verbose
ufw enable

apt-get install -y mosh
apt-get install -y gcc
apt-get install -y fail2ban

#https://www.digitalocean.com/community/tutorials/how-to-protect-ssh-with-fail2ban-on-ubuntu-14-04
cp jail.local /etc/fail2ban/
service jail2ban restart


# Install VIM 8
add-apt-repository ppa:jonathonf/vim
apt update
apt install vim
cp vimrc ~/.vimrc

# Install Rust
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustup component add rust-src
rustup component add rust-docs
rustup update
rustup toolchain install nightly


git config --global user.email "algermissen@acm.org"
git config --global user.name "Jan Algermissen"

# For dropbox
#sudo apt-get install python-gpgme
#wget https://linux.dropbox.com/packages/ubuntu/dropbox_2015.10.28_amd64.deb
#apt-get install ./dropbox_2015.10.28_amd64.deb

# TMUX
cp tmux.conf ~/.tmux.conf
cp dev-temux ~/dev-tmux



