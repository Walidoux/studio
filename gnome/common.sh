#!/bin/env bash

GREEN='\033[1;32m'
ORANGE='\033[1;33m'
RED='\033[1;31m'
NC='\033[0m'

CONFIG_USER="Walidoux"
CONFIG_EMAIL="ma.walidkorchi@icloud.com"

CONFIG_THEME_NAME="Themoux"

debug () {
  echo -e "${1}${2}$NC"
}

if [ "$EUID" -ne 0 ]; then
  debug $RED "🐶 Where's your sudo friend?$NC"
  exit 1
fi
