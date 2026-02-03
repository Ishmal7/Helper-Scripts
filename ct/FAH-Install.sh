#!/usr/bin/env bash
source <(curl -s https://raw.githubusercontent.com/tteck/Proxmox/main/misc/build.func)
# Copyright (c) 2021-2024 tteck
# Author: tteck (tteckster)
# License: MIT
# https://github.com/tteck/Proxmox/raw/main/LICENSE


function header_info {
clear
cat <<"EOF"
 _____     _     _ _                 ____    _   _                      
|  ___|__ | | __| (_)_ __   __ _    / __ \  | | | | ___  _ __ ___   ___ 
| |_ / _ \| |/ _` | | '_ \ / _` |  / / _` | | |_| |/ _ \| '_ ` _ \ / _ \
|  _| (_) | | (_| | | | | | (_| | | | (_| | |  _  | (_) | | | | | |  __/
|_|  \___/|_|\__,_|_|_| |_|\__, |  \ \__,_| |_| |_|\___/|_| |_| |_|\___|
                           |___/    \____/                              

EOF
}
header_info
echo -e "Loading..."
APP="Folding@Home"
var_disk="2"
var_cpu="1"
var_ram="512"
var_os="debian"
var_version="13"
variables
color
catch_errors

function default_settings() {
  CT_TYPE="1"
  PW=""
  CT_ID=$NEXTID
  HN=$NSAPP
  DISK_SIZE="$var_disk"
  CORE_COUNT="$var_cpu"
  RAM_SIZE="$var_ram"
  BRG="vmbr0"
  NET="dhcp"
  GATE=""
  APT_CACHER=""
  APT_CACHER_IP=""
  DISABLEIP6="no"
  MTU=""
  SD=""
  NS=""
  MAC=""
  VLAN=""
  SSH="no"
  VERB="no"
  echo_default
}


start
build_container
description

msg_ok "Completed Successfully!\n"
echo -e "${APP} Setup should be https://foldingathome.org/guides/v8-5-client-guide/
         edit the file /etc/fah-client/config.xml \n"