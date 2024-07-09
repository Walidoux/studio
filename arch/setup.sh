#!/bin/env bash

loadkeys fr && setfont ter-132b
pacman-key --init && pacman-key --populate

# Find WLAN connections and connect to internet, wlan0 and network0 are placeholders respectively for device and network
iwctl
device list
station wlan0 show
station wlan0 scan
station wlan0 connect network0
