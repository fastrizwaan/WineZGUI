# WineZGUI

#### Wine GUI using Zenity

![](https://raw.githubusercontent.com/fastrizwaan/WineZGUI/main/assets/winezgui.svg)

## What is WineZGUI

WineZGUI (pronounced Wine-Zee-Goo-Eee) is a wine frontend for playing windows games with wine easily. It is a collection of Bash scripts for Wine Prefix Management and Linux Desktop Integration for easier wine gaming experience using Zenity. It allows quick launching of Direct play (not installed) EXE application or game from File Manager like Nautilus and allow creating separate wine prefix for each Windows' EXE binary.

## Why WineZGUI?

1. Runs windows games or exe files from file manager

2. Creates application shortcut for easier access.

3. Focus on running games and not setting up prefixes.

## How it works

1. When a windows binary or exe is opened with WineZGUI, 

2. It asks whether to launch with default wine prefix (~/.local/share/winezgui/default) or create a new prefix associated with the EXE filename. 

3. If the user selects `create prefix`, then WineZGUI tries to extract Product Name and icon from the exe file, if name is found, it uses that else, uses name of the exe file. Both name and icon can be changed later from the gui.

4. Later if the user again opens the previously opened exe which as associated with a prefix, it will recommend to run using that associated prefix, so that game saves, and other settings, etc. can be used.

### Install WineZGUI

I highly recommend using flatpak version, because, distro based wine (wine-staging) keeps on updating and games may break every few days. Using wine stable from flathub is better or use wine stable 5.0 or 7.0 from the distro packages.

#### Install WineZGUI flatpak on [supported Linux distros](https://flatpak.org/setup/)

Download [io.github.WineZGUI_0_4_20220608.flatpak](https://github.com/fastrizwaan/WineZGUI-Releases/releases/download/WineZGUI-0.4_20220608/io.github.WineZGUI_0_4_20220608.flatpak) and install with the software center or using command line (just copy paste these on a terminal):

```
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak --user -y install flathub org.winehq.Wine/x86_64/stable-21.08
wget https://github.com/fastrizwaan/WineZGUI-Releases/releases/download/WineZGUI-0.4_20220608/io.github.WineZGUI_0_4_20220608.flatpak
flatpak --user -y install io.github.WineZGUI_0_4_20220608.flatpak
```

### Build and install flatpak from source

Please install `flatpak-builder` in the Linux system before running these commands. Install script will install `org.freedesktop.Sdk/x86_64/21.08`and `org.winehq.Wine`

##### Version 0.4

```
git clone --depth 1 --branch 0.4 https://github.com/fastrizwaan/WineZGUI.git
./WineZGUI/flatpak-manifest/install.sh
```

#### Development version

```
git clone https://github.com/fastrizwaan/WineZGUI.git
./WineZGUI/flatpak-manifest/install.sh
```

flatpak's optional requirement is `gnome-terminal` if we need to access prefix using shell

### SETUP on a Linux system, see [Requirements](https://github.com/fastrizwaan/WineZGUI#requirements)

Setup is instant as it copies a few files to specific directories.

##### Version 0.4

Downoad source [WineZGUI-0.4.tar.gz](https://github.com/fastrizwaan/WineZGUI/archive/refs/tags/0.4.tar.gz) or use `git tag 0.4`

##### Using tar.gz

```
wget https://github.com/fastrizwaan/WineZGUI/archive/refs/tags/0.4.tar.gz
tar -zxvf 0.4.tar.gz
cd WineZGUI-0.4
sudo ./setup --install ; #systemwide
```

```
git clone --depth 1 --branch 0.4 https://github.com/fastrizwaan/WineZGUI.git
cd WineZGUI
sudo ./setup --install ; #systemwide
```

##### Development version

```
git clone https://github.com/fastrizwaan/WineZGUI.git
cd WineZGUI
sudo ./setup --install ; #systemwide
```

### Uninstall WineZGUI

##### Flatpak uninstall

```
flatpak remove io.github.WineZGUI
```

##### System  uninstall

Run `uninstall` from the same installation directory 

```
sudo ./setup --uninstall
```

## Requirements

`wine` - main program
`winetricks` - must have wine addon script
`perl‑image‑exiftool` - to extract application/game name
`icoutils` - to extract icon from exe file
`gnome-terminal` - (optional) to access prefix directory in shell

## Install Requirements for Linux OS

### Fedora 36

`sudo dnf install zenity wine winetricks perl-Image-ExifTool icoutils gnome-terminal`

### Debian / Ubuntu

```
sudo dpkg --add-architecture i386
sudo apt install zenity wine winetricks libimage-exiftool-perl icoutils gnome-terminal
```

### Solus

```
sudo eopkg it zenity wine winetricks perl-image-exiftool icoutils gnome-terminal
```
