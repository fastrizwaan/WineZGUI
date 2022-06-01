#!/bin/bash

# flatpak-builder installed?
if ! command -v flatpak-builder &>/dev/null; then
     echo "Please install 'flatpak-builder' using your distro's package manager"
     echo ""
     echo "Debian/Ubuntu: sudo apt install flatpak-builder"
     echo "Fedora/Centos: sudo yum install flatpak-builder"
     echo "Fedora Silverblue: rpm-ostree install flatpak-builder" 
     echo "Solus: sudo eopkg it flatpak-builder"
     exit 1
fi


if [ $# -eq 0 ];  then
    echo "Building and installing winezgui flatpak!"
    echo "Info: to build a flatpak bundle! run:"
	echo "$0 bundle"
fi
	
	
DATE=$(date +'%Y%m%d')

# handle relative path
SCRIPT_NAME="$(realpath -m $0)"
SCRIPT_DIR=$(dirname ${SCRIPT_NAME})

echo SCRIPT_NAME="$(realpath -m $0)"
echo SCRIPT_DIR=$(dirname ${SCRIPT_NAME})

export FLATPAK_BUILD_DIR=~/.build/winezgui-flatpak
# create a cleanup script


echo '
rm -rvf ~/.local/share/applications/winezgui          \
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

flatpak-builder --force-clean build-dir io.github.WineZGUI.yml 
# Create flatpak bundle?
if [ "$1" = "bundle" ]; then
echo "Please wait building bundle... io.github.WineZGUI-$DATE.flatpak"
flatpak build-bundle ~/.local/share/flatpak/repo io.github.WineZGUI-$DATE.flatpak io.github.WineZGUI  master
echo "Installing the flatpak.."
echo "flatpak install --user io.github.WineZGUI-$DATE.flatpak"
flatpak remove --user io.github.WineZGUI -y 2>/dev/null
flatpak install --user io.github.WineZGUI-$DATE.flatpak -y
else 
flatpak-builder --user --install  --force-clean build-dir io.github.WineZGUI.yml && echo -e "\n\nSuccess: Installed WineZGUI flatpak!!!" && echo "run: 	flatpak run io.github.WineZGUI" 
fi


if [ $# -eq 0 ];  then
    echo ""
    echo "If you want to build a WineZGUI flatpak bundle! run:"
        echo "$0 bundle"
fi

