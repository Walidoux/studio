# ⚗️ Laboratory

My working environment where I mostly spend enjoying writing code in my spare time.

This may not suit your preferences, use my config wisely...

## 🏗️ Directory structure

```bash
lua/ # nvim setup
├─ config/
├─ plugins/
arch/ # system dotfiles/executables
├─ resources/
└─ config/
hyprland/ # desktop setup/config
└─
```

## 🛠️ Specs

### 💻 Computer

- Machine: LENOVO IdeaPad 5 14ARE05
- CPU: AMD Ryzen 3 4300U with Radeon Graphics / 64 bits
- Graphics:
  - Device: AMD Renoir (Radeon Vega Series / Radeon Mobile Series)
  - Driver: AMDGPU
- Audio: AMD Renoir Radeon High Definition Audio
- Network: Intel Wi-Fi 6 AX200
- Storage: OEM Samsung 128GB M.2 PCIe NVME

_Credits goes to [inxi - CLI system information tool](https://github.com/smxi/inxi)_

### ⚙️ System

- Distro-OS: [Arch](https://archlinux.org/) Linux
- Compositor: Wayland (Using [Hyprland](https://hyprland.org/))
- IDE: Neovim (powered by [LazyVim](https://github.com/LazyVim/LazyVim) and extending [folke's awesome workflow](https://lazy.folke.io/))
- Browser: Firefox
- Shell: zsh

## 🏷️ Stuff I like to use

- [Solaar - Device manager for Logitech](https://github.com/pwr-Solaar/Solaar)
- [MagicaVoxel - Lightweight GPU-based Voxel Art Editor](https://ephtracy.github.io/)
- [Lutris - Open source game manager library](https://lutris.net/)

### Motivation

I've never been comfortable working with VSCode since extensions make the startup time of the window instance slower than ever, especially regarding Rust Analyzer and Type
script LSPs.Also styling the UI of the window is cumbersome, it's definitely not worth putting effort to it when you're using Linux.

Jetbrains products, meh, so many things I wouldn't bother myself using since I've already tried both Webstome and Rustover (Beta version).

Didn't have quite the time to make an IDE myself out of VSCodium clone and I've also looked forward a long time ago to use Nvim. I decided to give it a shot and got addict
ed to it tbh.

## 👍 Good to know

### ⚡ Boot load time faster

Setting `GRUB_TIMEOUT_STYLE=hidden` in `/etc/default/grub`, it'll disable the screen of choosing boot options.

### 🔒 Storing passwords for SSH connections without prompting them

```sh
ssh-keygen -t rsa
ssh-copy-id -i saved-keygen-file.pub username@host
ssh username@host
```

### 🔑 Importing/Exporting GPG keys (Inspired from RedHat GPG migration manual)

#### Exporting keys + trust database

```bash
## export public key
gpg -a --export > pub_key.asc

## export encrypted private key (which will also include corresponding public keys)
gpg -a --export-secret-keys > private_key.asc

## export gpg's trustdb to a text file
gpg --export-ownertrust > otrust.txt
```

#### Importing keys + trust database

```sh
gpg --import private_key.asc
gpg --import pub_key.asc
gpg -K # ?? wtf
gpg --import-ownertrust otrust.txt
```

## 🎯 Current Focus and Future

- [ ] Add nvim-java lsp to support Java syntax highlighting, suggestions and autocompletions
- [ ] Add svg preview, maybe ?
- [ ] Make dev containers work, if it's worth it ?
- [ ] What about Github Copilot autocompletions ?
- [ ] MDX language support ?
- [ ] Prisma language support
- [ ] Svelte language support
- [x] Tailwind CSS Intellisense
- [ ] Thunder client alternative to test API's
- [ ] Add emojisense to insert emojis
- [x] Enhance DRPC
- [ ] Docker extension for nvim ?
- [ ] Editorconfig support
- [ ] Import cost npm packages except for cargo files
- [ ] remote ssh sessions on Neovim
- [ ] Track time spent in each workspace, file and language
- [ ] versions lens to preview new package versions
