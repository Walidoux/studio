#!/bin/env bash

source common.sh

cp ~/.zshrc $RESOURCES_PATH
cp /etc/pacman.conf $RESOURCES_PATH
cp /etc/mpv/mpv.conf $RESOURCES_PATH # necessary ?

# Saved networks
NETWORKS_FILE="$RESOURCES_PATH/networks.tar.gz"
find /etc/NetworkManager/system-connections -type f -print0 | tar --null -cvzf $NETWORKS_FILE --transform='s|^.*/||' --files-from -
chmod 777 $NETWORKS_FILE

verbose $GREEN "Backup completed, double-check if you haven't missed any file and commit the staed changes"
