#!/bin/env bash

common common.sh

## Inspiration: https://github.com/Lxtharia/minegrub-theme
verbose $BLUE "🎨 Theming bootloader (GRUB)"
GRUB_THEME_PATH=/tmp/minegrub-theme/minegrub

pacman -Syu python-pillow # needed for random splash texts, see: ./minegrub/assets/splashes.txt
git clone --depth=1 https://github.com/Lxtharia/minegrub-theme.git /tmp/minegrub-theme
cp $GRUB_THEME_PATH/background_options/* $GRUB_THEME_PATH/backgrounds
mkdir -p /boot/grub/themes/ && cp -ruv $GRUB_THEME_PATH /boot/grub/themes/
cp $GRUB_THEME_PATH/minegrub-update.service /etc/systemd/system

systemctl enable minegrub-update.service
export GRUB_THEME=/boot/grub/themes/minegrub/theme.txt
grub-mkconfig -o /boot/grub/grub.cfg
