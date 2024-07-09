#!/bin/env bash

source common.sh

cp ~/.zshrc "$(pwd)/resources"

NETWORKS_FILE="$(pwd)/resources/networks.tar.gz"
sudo find /etc/NetworkManager/system-connections -type f -print0 | sudo tar --null -cvzf $NETWORKS_FILE --transform='s|^.*/||' --files-from -
chmod 777 $NETWORKS_FILE
