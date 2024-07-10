#!/bin/env bash

GREEN='\033[1;32m'
ORANGE='\033[1;33m'
RED='\033[1;31m'
NC='\033[0m'

RESOURCES_PATH="$(pwd)/resources"
CONFIG_PATH="$(pwd)/config.yml"

# for debugging purposes
verbose() {
  echo -e "${1}${2}$NC"
}

# Parsing yaml content
# Usage: $(@ 'username')
@() {
  local keys=("$@")
  local yq_expr

  yq $(
    IFS='.'
    echo "${keys[*]}"
  ) $CONFIG_PATH
}

# populate sudo rule across executables
if [ "$EUID" -ne 0 ]; then
  verbose $RED "🐶 Where's your sudo friend?$NC"
  exit 1
fi
