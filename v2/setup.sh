#!/bin/bash

rustup override set nightly
rustc --version

#rustup component add rust-src --toolchain nightly-x86_64-unknown-linux-gnu
rustup component add rust-src

#rustup target add x86_64-utkon-os

cargo install bootimage
rustup component add llvm-tools-preview

sudo apt install gcc-multilib -y

# build ISO image
sudo apt-get install -y xorriso
sudo apt install -y mtools

sudo apt-get install -y qemu qemu-system-x86

cargo install cargo-xbuild
cargo install cargo-binutils