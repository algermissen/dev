#!/bin/bash


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
