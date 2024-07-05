#!/bin/env bash

# catapult styles ?
# source: https://github.com/otsaloma/catapult#documentation

GNOME_THEME_PATH=$HOME/.themes/$CONFIG_THEME_NAME/gnome-shell/

mkdir -p $GNOME_THEME_PATH
cp ../theme/gnome-shell.css $GNOME_THEME_PATH/gnome-shell.css
