#!/bin/env bash

source ../common.sh

## Required packages: yq - git - gnupg
gpg --import resources/gpg_private_key.asc
GPG_KEY=$(gpg --list-secret-keys --keyid-format short | grep sec | cut -d' ' -f 4 | tail -c 9)

git config --global user.name $(yq '.username' $CONFIG_PATH)
git config --global user.email $(yq '.email' $CONFIG_PATH)
git config --global user.signingkey $GPG_KEY
git config --global commit.gpgsign true
git config --global fetch.prune true
git config --global tag.gpgSign true
git config --global credential.helper store
git config --global gpg.program $(which gpg)
git config --global init.defaultBranch main
