#!/usr/bin/env bash

# Author: Ishmal7 
# Source: https://github.com/FoldingAtHome/fah-client-bastet

# Setup environment
source /dev/stdin <<<"$FUNCTIONS_FILE_PATH"
color
verb_ip6
catch_errors
setting_up_container
network_check
update_os

# install dependencies
msg_info "Installing Dependencies"
$STD apt update
$STD apt install -y 
    scons 
    git 
    npm 
    build-essential 
    fakeroot 
    libssl-dev 
    zlib1g-dev 
    libbz2-dev 
    liblz4-dev
    libsystemd-dev
msg_ok "Dependencies installed"

# Clone Git Repos fah client
msg_info "Installing Folding@Home Client"
    git clone https://github.com/cauldrondevelopmentllc/cbang
    git clone https://github.com/foldingathome/fah-client-bastet
    git clone https://github.com/foldingathome/fah-web-client-bastet
msg_ok "Cloned Github Repositories"

# Install FAH Client
$STD export CBANG_HOME=$PWD/cbang
$STD scons -C cbang
$STD scons -C fah-client-bastet
$STD scons -C fah-client-bastet package

$STD apt install ./fah-client-bastet/fah-client_8.5.5_amd64.deb


#completion
motd_ssh
customize
cleanup_lxc