# 🚀 Terminoux

My Neovim workflow powered by [💤 LazyVim](https://github.com/LazyVim/LazyVim).

## Specs

(gnome-tweaks -v or dconf watch /) to toggle debug/verbose mode

you can make boot load time faster by setting GRUB_TIMEOUT_STYLE=hidden in /etc/default/grub, it'll disable the screen of choosing boot options

## 🔗 Commands

```sh
nvm install --lts
npm i -g pnpm
```

## 📦 Packages

- Mutter/(rounded)
  - Theme: [Blur Transparent windows and/or with rounded corners](https://github.com/yilozt/mutter-rounded)
  - Source code: [A Wayland display server and X11 window manager and compositor library.](https://gitlab.gnome.org/GNOME/mutter)

## 🛠️ Handy tools

- [dconf-editor - GUI manager for gnome settings](https://wiki.gnome.org/Apps/DconfEditor)

## 🏷️ Software/Apps used

- [Lightweight GPU-based Voxel Art Editor.](https://ephtracy.github.io/)

## 👍 Good to know

### Storing passwords for SSH connections without prompting them

```sh
ssh-keygen -t rsa
ssh-copy-id -i saved-keygen-file.pub username@host
ssh username@host
```

### Importing/Exporting GPG keys (Inspired from RedHat GPG migration manual)

#### Exporting keys + trust database

```sh
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
gpg -K
gpg -k
gpg --import-ownertrust otrust.txt
```

## Directory structure

It's on the work !

## 🤔 Wu do hell izdisse ?

My config files used for running my Neovim setup/workflow and other files related to system wide dependencies in the form of executable shell scripts for Linux.

### Motivation

I've never been comfortable working with VSCode since extensions make the startup time of the window instance slower than ever, especially regarding Rust Analyzer and Type
script LSPs.Also styling the UI of the window is cumbersome, it's definitely not worth putting effort to it when you're using Linux.

Jetbrains products, meh, so many things I wouldn't bother myself using since I've already tried both Webstome and Rustover (Beta version).

Didn't have quite the time to make an IDE myself out of VSCodium clone and I've also looked forward a long time ago to use Nvim. I decided to give it a shot and got addict
ed to it tbh.

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
