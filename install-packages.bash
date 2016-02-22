#!/bin/bash -ex

sudo apt-get update

# Install bare minimum packages
sudo apt-get -y install --no-install-recommends git stow tmux vim lsb-release
