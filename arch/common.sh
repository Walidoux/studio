#!/bin/env bash

GREEN='\033[1;32m'
ORANGE='\033[1;33m'
RED='\033[1;31m'
NC='\033[0m'

verbose() {
  echo -e "${1}${2}$NC"
}

if [ "$EUID" -ne 0 ]; then
  verbose $RED "🐶 Where's your sudo friend?$NC"
  exit 1
fi
