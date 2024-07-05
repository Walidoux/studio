#!/bin/env bash

common ../../common.sh

debug $BLUE "🎨 Theming the bootloader (GRUB)"
# theme used: https://github.com/Lxtharia/minegrub-theme

pacman -Syu python-pillow # needed for random splash texts, see: ./minegrub/assets/splashes.txt
git clone --depth=1 https://github.com/Lxtharia/minegrub-theme.git /tmp/minegrub-theme

GRUB_THEME_PATH=/tmp/minegrub-theme/minegrub

cp $GRUB_THEME_PATH/background_options/* $GRUB_THEME_PATH/backgrounds
mkdir -p /boot/grub/themes/ && cp -ruv $GRUB_THEME_PATH /boot/grub/themes/
cp $GRUB_THEME_PATH/minegrub-update.service /etc/systemd/system

systemctl enable minegrub-update.service

debug $GREEN "Make sure to edit /etc/default/grub and set GRUB_THEME=/boot/grub/themes/minegrub/theme.txt"
debug $GREEN "and execute sudo grub-mkconfig -o /boot/grub/grub.cfg"
