#!/bin/bash

# flatpak-builder installed?
if ! command -v flatpak-builder &>/dev/null; then
     echo "Please install 'flatpak-builder' using your distro's package manager"
     echo ""
     echo "Debian/Ubuntu: sudo apt install flatpak-builder"
     echo "Fedora/Centos: sudo yum install flatpak-builder"
     echo "Fedora Silverblue: rpm-ostree install flatpak-builder" 
     echo "Solus: sudo eopkg it flatpak-builder"
     echo "Arch/EndeavourOS: sudo pacman -Sy flatpak-builder"
     exit 1
fi


#if [ $# -eq 0 ];  then
#    echo "Building and installing winezgui flatpak!"
#    echo "Info: to build a flatpak bundle! run:"
#    echo "$0 bundle"
#fi
	
APP_ID="io.github.fastrizwaan.WineZGUI"
DATE=$(date +'%Y%m%d')

# handle relative path for building
SCRIPT_NAME="$(realpath -m $0)"
SCRIPT_DIR=$(dirname ${SCRIPT_NAME})

echo SCRIPT_NAME="$(realpath -m $0)"
echo SCRIPT_DIR=$(dirname ${SCRIPT_NAME})

APPVERSION=$(cat ${SCRIPT_DIR}/../VERSION.txt|sed 's/\./_/g')

# Where to build the flatpak?
export FLATPAK_BUILD_DIR=~/.build/winezgui-flatpak

# create a cleanup script
echo '
rm -rvf ~/.local/share/applications/winezgui          \
        ~/.local/share/winezgui/                      \
        ~/.var/app/${APP_ID}/data/prefixes
' > ${FLATPAK_BUILD_DIR}/cleanup.sh

chmod +rx ${FLATPAK_BUILD_DIR}/cleanup.sh

mkdir -p ${FLATPAK_BUILD_DIR}

# Remove symoblic links if exist in build_dir
find ${FLATPAK_BUILD_DIR} -maxdepth 1 -type l -delete

# Link files and build
echo "Building flatpak inside ${FLATPAK_BUILD_DIR}..."
ln -s ${SCRIPT_DIR}/* ${FLATPAK_BUILD_DIR}
cd ${FLATPAK_BUILD_DIR}


# flatpak build requires these:
# org.freedesktop.Sdk/x86_64/21.08
# org.freedesktop.Platform/x86_64/21.08
# org.winehq.Wine/x86_64/stable-21.08

(flatpak --user remote-add --if-not-exists \
 flathub https://flathub.org/repo/flathub.flatpakrepo 
 flatpak list |grep org.freedesktop.Platform/x86_64/21.08 || \
 flatpak --user -y install flathub org.freedesktop.Sdk/x86_64/21.08; 
 flatpak list |grep org.freedesktop.Platform/x86_64/21.08 || \
 flatpak --user -y install flathub org.freedesktop.Platform/x86_64/21.08; 
 flatpak list |grep org.winehq.Wine/x86_64/stable-21.08   || \
 flatpak --user -y install flathub org.winehq.Wine/x86_64/stable-21.08
) && \
 echo "Installed dependencies for ${APP_ID}"


echo "Building ${APP_ID}..."
flatpak-builder --force-clean build-dir ${APP_ID}.yml && \
echo "Built ${APP_ID}..."

if [ "$1" = "system" ]; then
     INSTALL="--system"
     SUDO="sudo"
else
     INSTALL="--user"
     unset SUDO
fi
echo "Installing ${APP_ID}..."
${SUDO} flatpak-builder ${INSTALL}  --install --force-clean build-dir ${APP_ID}.yml && \
echo -e "\n\nSuccessfully installed ${APP_ID} flatpak!"
echo -e "run:\nflatpak run ${APP_ID}" 

# Create flatpak bundle?
if [ "$1" = "bundle" ]; then
     MSG=("Please wait building bundle...")
     BUNDLE="${APP_ID}_${APPVERSION}_${DATE}.flatpak"
     REPO=~/.local/share/flatpak/repo
   
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

