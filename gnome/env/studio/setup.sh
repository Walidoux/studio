#!/bin/env bash

source ../common.sh

yay -Syu vscodium-bin nvm
flatpak install flathub com.obsproject.Studio com.valvesoftware.Steam com.mojang.Minecraft

debug $ORANGE "🐳 Installing Terminoux"
# todo

debug $ORANGE "Installing packages for tauri development"
# https://beta.tauri.app/guides/prerequisites/
# webkit2gtk-4.1 might be needed for tauri v2
pacman -Syu
pacman -S --needed \
  webkit2gtk \
  base-devel \
  file \
  openssl \
  appmenu-gtk-module \
  libappindicator-gtk3 \
  librsvg \
  libvips

curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

debug $BLUE "🎨 Theming the studio environment"
bash theme.sh

debug $BLUE "⚙️ Setting up GIT & Importing GPG keys"
bash git.sh
