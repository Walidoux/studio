#!/bin/env bash

source common.sh

verbose $ORANGE "Installing packages"
pacman --sync --needed --noconfirm \
  noto-fonts \
  noto-fonts-cjk \
  noto-fonts-emoji \
  noto-fonts-extra \
  otf-firamono-nerd \
  ttf-firacode-nerd \
  ttf-nerd-fonts-symbols \
  gst-libav \
  bash-completion \
  pacman-contrib \
  wget \
  bat \
  jdk-openjdk \
  xclip \
  lolcat \
  rust

# install deps for tauri development
# pacman -Syu
# pacman -S --needed \
# webkit2gtk \
# base-devel \
# file \
# openssl \
# appmenu-gtk-module \
# libappindicator-gtk3 \
# librsvg \
# libvips

# curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

flatpak install \
  com.obsproject.Studio \
  com.stremio.Stremio \
  com.valvesoftware.Steam \
  com.spotify.Client \
  io.github.pwr_solaar.solaar

verbose $ORANGE "Copying DOTFILES"
cp /etc/pacman.conf "$(pwd)/resources"

verbose $ORANGE "Pre-configuring"
# xdg-settings set default-web-browser thorium-browser.desktop
# systemctl enable paccache.timer
# mv "$(pwd)/resources/mpv.conf" /etc/mpv/mpv.conf
