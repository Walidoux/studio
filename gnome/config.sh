#!/bin/env bash

gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com

# 🛠️ Tweaks

gsettings set org.gnome.nautilus.preferences default-sort-order "type"
gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"
gsettings set org.gnome.nautilus.icon-view default-zoom-level "medium"
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'areas'

# ⌨ Shortcuts

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Catapult'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'catapult'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>space'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name "'File Explorer'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command "'nautilus'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding "'<Super>e'"

# mpv media player

MPV_CONF="/etc/mpv/mpv.conf"
MPV_DIR=$(dirname $MPV_CONF)

[ -d $MPV_DIR ] || mkdir -p $MPV_DIR
[ -e $MPV_CONF ] || touch $MPV_CONF

echo 'loop-file=inf' | tee -a $MPV_CONF
echo 'hwdec=auto' | tee -a $MPV_CONF

# system

systemctl enable paccache.timer

# misc

xdg-settings set default-web-browser thorium-browser.desktop

