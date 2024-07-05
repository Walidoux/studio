#!/bin/env bash

source common.sh

debug $ORANGE "Installing fonts"

pacman --sync --needed --noconfirm \
  font-manager \
  noto-fonts \
  noto-fonts-cjk \
  noto-fonts-emoji \
  noto-fonts-extra \
  otf-firamono-nerd \
  ttf-firacode-nerd \
  ttf-nerd-fonts-symbols

debug $ORANGE "Installing packages"

pacman --sync --needed --noconfirm \
  gst-libav \
  bash-completion \
  pacman-contrib \
  wget \
  bat \
  jdk-openjdk \
  xclip \
  lolcat \
  rust

debug $ORANGE "Installing applications"

flatpak install flathub de.shorsh.discord-screenaudio com.discordapp.Discord io.github.pwr_solaar.solaar
yay -Syu thorium-browser-bin icloud-for-linux-git chrome-gnome-shell

debug $ORANGE "Clean up of pre-installed GNOME applications"

pacman -Rcns --noconfirm \
	epiphany

bash config.sh
su studio && bash studio/setup.sh
su studies && bash studies/setup.sh
