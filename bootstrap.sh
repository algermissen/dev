#!/bin/bash

cp vimrc /dev/.vimrc

curl https://sh.rustup.rs -sSf | sh

source $HOME/.cargo/env

rustup component add rust-src
rustup component add rust-docs

rustup update

rustup toolchain install nightly
