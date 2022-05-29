#!/bin/bash

# handle relative path

SCRIPT_NAME="$(realpath -m $0)"
SCRIPT_DIR=$(dirname ${SCRIPT_NAME})

echo SCRIPT_NAME="$(realpath -m $0)"
echo SCRIPT_DIR=$(dirname ${SCRIPT_NAME})

export FLATPAK_BUILD_DIR=~/.build/winezgui-flatpak
# create a cleanup script
echo'
rm -rf ~/.local/share/applications/winezgui          \
       ~/.local/share/winezgui/                      \
       ~/.var/app/io.github.WineZGUI/data/prefixes
' > ${FLATPAK_BUILD_DIR}/cleanup.sh

chmod +rx ${FLATPAK_BUILD_DIR}/cleanup.sh

mkdir -p ${FLATPAK_BUILD_DIR}

# Remove symoblic links if exist in build_dir
find ${FLATPAK_BUILD_DIR} -maxdepth 1 -type l -delete

# Link files and build
ln -sv ${SCRIPT_DIR}/* ${FLATPAK_BUILD_DIR}
cd       ${FLATPAK_BUILD_DIR}

# find if sdk is not installed, else install it
if [ ! -f ./sdk-installed.txt ]; then
    flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak list |grep org.freedesktop.Sdk || flatpak --user -y install org.freedesktop.Sdk/x86_64/21.08 && touch ./sdk-installed.txt
fi

# if wine flatpak is not installed 
if [ ! -f ./wine-installed.txt ]; then
    flatpak list|grep org.winehq.Wine/x86_64/stable-21.08 || flatpak --user -y install org.winehq.Wine/x86_64/stable-21.08 && touch ./wine-installed.txt
fi

echo $PWD
flatpak-builder --user --install  --force-clean build-dir io.github.WineZGUI.yml 
