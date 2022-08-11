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
	
APP_ID="io.github.fastrizwaan.WineZGUI"
DATE=$(date +'%Y%m%d')

# handle relative path for building
SCRIPT_NAME="$(realpath -m $0)"
SCRIPT_DIR=$(dirname ${SCRIPT_NAME})

echo SCRIPT_NAME="$(realpath -m $0)"
echo SCRIPT_DIR=$(dirname ${SCRIPT_NAME})

APPVERSION=$(cat ${SCRIPT_DIR}/../VERSION.txt|sed 's/\./_/g')

# Where to build the flatpak?
export FLATPAK_BUILD_DIR=~/.build/FLATPAK_BUILD_DIR/flatpak-winezgui

mkdir -p ${FLATPAK_BUILD_DIR}

# Remove symoblic links if exist in build_dir
find ${FLATPAK_BUILD_DIR} -maxdepth 1 -type l -delete

# Link files and build
echo "Building flatpak inside ${FLATPAK_BUILD_DIR}..."
ln -s ${SCRIPT_DIR}/* ${FLATPAK_BUILD_DIR}
cd ${FLATPAK_BUILD_DIR}

echo "Install these Dependencies in the system or as user"
echo \
'#-----------------------system---------------------------------------
flatpak remove --user --all ; # Run as user
sudo flatpak --system remote-add --if-not-exists \
flathub https://flathub.org/repo/flathub.flatpakrepo 
sudo flatpak --system -y install flathub org.freedesktop.Sdk/x86_64/21.08; 
sudo flatpak --system -y install flathub org.freedesktop.Platform/x86_64/21.08; 
sudo flatpak --system -y install flathub org.winehq.Wine/x86_64/stable-21.08
#------------------------user----------------------------------------------
flatpak --user remote-add --if-not-exists \
flathub https://flathub.org/repo/flathub.flatpakrepo 
flatpak --user -y install flathub org.freedesktop.Sdk/x86_64/21.08; 
flatpak --user -y install flathub org.freedesktop.Platform/x86_64/21.08; 
flatpak --user -y install flathub org.winehq.Wine/x86_64/stable-21.08
#------------------------user----------------------------------------------'

# Building flatpak
echo "Building ${APP_ID}..."
flatpak-builder --force-clean build-dir ${APP_ID}.yml && \
echo "Built ${APP_ID}..." || \
exit 1

# Prefer system install
if [ "$1" = "user" ]; then

     echo "Building ${APP_ID}..."
     flatpak-builder --force-clean build-dir ${APP_ID}.yml && \     
     echo "Built ${APP_ID}..." || exit 1

     echo "Installing ${APP_ID}..."
     flatpak-builder --user --install --force-clean build-dir ${APP_ID}.yml && \
     echo -e "\n\nSuccessfully installed ${APP_ID} flatpak as user ${USER}!" || \
     exit 1
     echo -e "run:\nflatpak run ${APP_ID}" 
else
     echo "Building ${APP_ID}..."
     flatpak-builder --force-clean build-dir-root ${APP_ID}.yml && \     
     echo "Built ${APP_ID}..." || exit 1
     
     echo "Installing ${APP_ID}... systemwide"
     sudo flatpak-builder --system --install --force-clean build-dir-root ${APP_ID}.yml && \
     echo -e "\n\nSuccessfully installed ${APP_ID} flatpak in the system!" || \
     exit 1
     echo -e "run:\nflatpak run ${APP_ID}" 
fi

# Create flatpak bundle?
if [ "$1" = "bundle" ]; then
     MSG=("Please wait building bundle...")
     BUNDLE="${APP_ID}_${APPVERSION}_${DATE}.flatpak"
     #REPO=~/.local/share/flatpak/repo
     REPO=/var/lib/flatpak/repo
   
     echo "$MSG $BUNDLE"    

     # Create flatpak bundle
     flatpak build-bundle ${REPO} ${BUNDLE} ${APP_ID} main && \
     echo "Sucessfully built ${BUNDLE}!"

     echo "Generating sha256sum of ${APP_ID}"
     sha256sum ${BUNDLE} |tee SHA256SUM
     
     MSG=()
     MSG+="Install command:\n"
     MSG+="flatpak --user remote-add --if-not-exists"
     MSG+="flathub https://flathub.org/repo/flathub.flatpakrepo\n"
     MSG+="flatpak install flathub org.winehq.Wine\n"
     MSG+="flatpak install --user ${BUNDLE}"

     echo -e "$MSG" | tee bundle-install-commands.sh
     chmod +x bundle-install-commands.sh
fi

if [ $# -eq 0 ];  then
    echo -e "\nTo build a ${APP_ID} flatpak bundle, run:"
    echo "$0 bundle"
fi

