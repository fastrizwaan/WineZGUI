#!/bin/bash

FLATPAK_BUILD_DIR="~/.build/winezgui-flatpak"
cd ${FLATPAK_BUILD_DIR}

# find if sdk is not installed, else install it
if [ ! -f ./sdk-installed.txt ]; then
    flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak list |grep org.freedesktop.Sdk || flatpak --user -y install org.freedesktop.Sdk/x86_64/21.08 && touch ./sdk-installed.txt
fi

# if wine flatpak is not installed 
if [ ! -f ./wine-installed.txt ]; then
    flatpak list|grep org.winehq.Wine/x86_64/stable-21.08 || flatpak --user -y install org.winehq.Wine/x86_64/stable-21.08 && touch ./wine-installed.txt
fi

flatpak-builder --user --install  --force-clean build-dir io.github.WineZGUI.yml 
