# find if sdk is installed, else install it
if [ ! -f ./sdk-installed.txt ]; then
    flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak list |grep org.freedesktop.Sdk || flatpak --user -y install org.freedesktop.Sdk/x86_64/21.08 && touch ./sdk-installed.txt
fi

flatpak-builder --user --install  --force-clean build-dir io.github.WineZGUI.yml ||grep -i org.freedesktop.Sdk
