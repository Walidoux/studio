#!/bin/env bash

# ⚠️  DO NOT RUN THIS
# this is meant to follow instructions, it'll throw an error either way

loadkeys fr && setfont ter-132b
pacman-key --init && pacman-key --populate

# Find WLAN connections and connect to internet
# wlan0 and network0 are placeholders respectively for device and network
iwctl
device list
station wlan0 show
station wlan0 scan
station wlan0 connect network0

# select mirrors ?

pacman -Syy

# Partitioning (for UEFI systems)

# Note: /dev/nvem is a placeholder, use lsblk to determine mountpoint name
cfdisk /dev/nvem # use GPT label type, MBR if booting is through BIOS
# task: wipe every partition from the concerned mount device

# prefered table schema for my machine:
# | Type | EFI System [1] | Swap [2] | Root (x86_64) [3] |
# |------|----------------|----------|-------------------|
# | Size | 300M           | 8G       | what's left owo   |

# Securing
# volume encryption to secure the stored data in the hard drive even more,
# dd if=/dev/urandom of=/dev/[3] bs=4096 # or: cryptsetup luksFormat /dev/[3]

# Formatting
mkfs.ext4 /dev/[3] && mkswap /dev/[2] && mkfs.vfat /dev/[1]

mount /dev/[3] /mnt
mkdir /mnt/boot && mount /dev/[1] /mnt/boot
swapon /dev/[2]

# Notes: amd-ucode microcode package is suitable for my needs since I own a AMD processor
pacstrap -K /mnt base base-devel linux linux-firmware sudo man networkmanager ntfs-3g grub efibootmgr amd-ucode gdm nano git
# dosfstools, lvm2 (used for encrypted hardrive), linux-headers (kernel), linux-lts (2nd kernel as fallback), linux-lts-headers

# /!\ extra steps needed for hooks in /etc/mkinitcpio.conf for encrypted hardrive on boot, kernel won't know how to deal with it

# Generating filesystem table
genfstab -U /mnt >>/mnt/etc/fstab # check if their are any inconsistencies: > cat /mnt/etc/fstab

# Go to mounted partition (root dir where magic happens uwu)
arch-chroot /mnt

# necessary ?
nmcli device wifi connect "<ssid>" password "<password>"

timedatectl set-ntp true # syncronization system clock
# necessary ?
timedatectl set-timezone $(@ 'user.continent')/$(@ 'user.city')

# Timezone
ln -sf "/usr/share/zoneinfo/$(@ 'user.continent')/$(@ 'user.city')" /etc/localtime
echo "LANG=en_US.UTF-8" >/etc/locale.conf

# System locale
sed -i '/#en_US.UTF-8/s/^#//' /etc/locale.gen
sed -i '/#en_GB.UTF-8/s/^#//' /etc/locale.gen
locale-gen

# Hardware clock
hwclock --systohc

# ???
# if ! grep -q '^KEYMAP=' /etc/vconsole.conf; then
# echo "KEYMAP=fr" >>/etc/vconsole.conf
# fi

block="
# 127.0.0.1    localhost
# ::1        localhost
# 127.0.0.1    $(@ 'system.name').localdomain    $(@ 'system.name')
"
echo "$block" | tee -a /etc/hosts >/dev/null
echo $(@ 'system.name') | sudo tee /etc/hostname >/dev/null

# User groups
mkinitcpio -P
useradd -m -G wheel,storage,power,audio,video,docker -s /bin/bash "$(@ 'system.name')"
passwd                      # root user
passwd "$(@ 'system.name')" # system user
sed -i '/^#\s*%wheel\s*ALL=(ALL)\s*ALL/s/^#\s*//' /etc/sudoers

# Install & configure grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# fstrim.timer ? ssd trim
systemctl enable networkmanager gdm bluetooth paccache.timer

# CTRL + D, then:
umount /mnt/boot/efi
umount /mnt
reboot
