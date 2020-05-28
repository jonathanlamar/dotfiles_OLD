#!/bin/bash

CLONEDIR=$HOME/repos/notMine

if [ ! -d $CLONEDIR ]
then
    echo "$CLONEDIR does not exist.  Creating it."
    mkdir -p $CLONEDIR
fi

cd $CLONEDIR

yes | sudo apt install libxext-dev libxcb1-dev libxcb-damage0-dev \
    libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev \
    libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev \
    libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev \
    libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev \
    libgl1-mesa-dev  libpcre2-dev  libevdev-dev uthash-dev libev-dev \
    libx11-xcb-dev ninja-build

git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
ninja -C build install