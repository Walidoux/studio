#!/bin/env bash

source common.sh

## Required packages: bootiso - gnupg
## Usage: sh pre-install.sh -i ~/Downloads/archlinux-x86_64.iso -s archlinux-x86_64.iso.sig
while getopts u:a:f: flag; do
  case "${flag}" in
  i) iso_path=${OPTARG} ;;
  s) signature_path=${OPTARG} ;;
  esac
done

# Install both the mirror (ISO) that is geographically close to Morocco and its signature (SIG)
signature=$(gpg --keyserver-options auto-key-retrieve --verify "$signature_path.iso.sig" 2>&1)
if echo "$signature" | grep -q "Good signature"; then
  bootiso -a -y $iso_path
else
  verbose $RED "Couldn't verify signature from downloaded mirror, exiting"
  exit 1
fi
