#!/bin/bash

# https://www.linode.com/docs/security/securing-your-server/

adduser dev
adduser dev sudo


sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config


sudo add-apt-repository ppa:jonathonf/vim
apt update
apt install vim
cp vimrc /dev/.vimrc

curl https://sh.rustup.rs -sSf | sh

source $HOME/.cargo/env

rustup component add rust-src
rustup component add rust-docs

rustup update

rustup toolchain install nightly

wget https://linux.dropbox.com/packages/ubuntu/dropbox_2015.10.28_amd64.deb
sudo apt-get install ./dropbox_2015.10.28_amd64.deb





