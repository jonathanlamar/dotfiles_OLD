#!/bin/bash

yes | sudo apt-get install \
  cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev \
  libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev \
  libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen \
  xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev \
  libiw-dev libcurl4-openssl-dev libpulse-dev \
  libxcb-composite0-dev xcb libxcb-ewmh2

CLONEDIR=$HOME/repos/notMine

if [ ! -d $CLONEDIR ]
then
    echo "$CLONEDIR does not exist.  Creating it."
    mkdir -p $CLONEDIR
fi

git clone https://github.com/jaagr/polybar.git $CLONEDIR/polybar
cd $CLONEDIR/polybar
git checkout 3.4.3 # TODO: Detect max release

# TODO: Answer prompts here.  No for first question, yes for all subsequent
# questions.
./build.sh
cd ..
rm -rf polybar

# Needed vanilla i3 to install polybar.  Will install i3 gaps instead.
yes | sudo apt remove i3-wm
