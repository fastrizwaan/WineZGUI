# WineZGUI 
#### Wine GUI using Zenity
![](https://raw.githubusercontent.com/fastrizwaan/WineZGUI/main/assets/winezgui.svg)

## What is WineZGUI
WineZGUI (pronounced Wine-Zee-Goo-Eee) is a collection of Bash scripts for Wine Prefix Management and Linux Desktop Integration for easier wine gaming experience using Zenity. It allows quick launching of Direct play (not installed) EXE application from File Manager like Nautilus and allow creating separate wine prefix for each Windows' EXE binary.

## Quickly run WineZGUI 0.2 using flatpak
Install dependencies
```
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak --user -y install org.winehq.Wine/x86_64/stable-21.08 
wget https://github.com/fastrizwaan/flatpak-wine-releases/releases/download/WineZGUI-0.2/io.github.WineZGUI-0.2_20220602.flatpak
flatpak --user install io.github.WineZGUI-0.2_20220602.flatpak

#run
flatpak run io.github.WineZGUI
```
Sha256 sum of flatpak
```
sha256sum io.github.WineZGUI-0.2_20220602.flatpak
d4a83cf895146c5e0fa28c76d34893c02db14b695c536ef87498b8503d4ee76c
```

## Why WineZGUI?
WineZGUI helps in:
1. Quick launching of windows games or exe files from file manager
2. Create desktop shortcut along with separate wine prefix for that exe.

## How it works
When an exe is opened with WineZGUI, it asks whether to launch with default wine prefix (~/.local/share/winezgui/default) or create a new prefix with the EXE filename. Here the user can specify the Name, else Filename is used. Also WineZGUI uses icoutils to extract icon from exe file and uses that.

### Naming used
`WineZGUI` - Application Name uses case sensitive "WineZGUI"
 `winezgui` - Rest all use "winezgui" for Directory name  Bash script (without .sh), Icon, Application shortcut (.desktop) file etc., for ease of typing 

### Directories of WineZGUI
`~/.local/share/winezgui/` - It's like root directory where wineprefixes are created
`~/.local/share/winezgui/default/` - default wine prefix to test / install exes
`~/.local/share/winezgui/FILENAME.EXE/` - user created wine prefix for selected exe, and holds .desktop file, icon file, and script to run exe with wine with this wine prefix.

### Scripts of WineZGUI
`/usr/bin/winezgui` - main bash script (program) to handle exe files
`~/.local/share/winezgui/FILENAME.EXE/FILENAME.sh` - prefix specific shell script to launch exe associated with this wine prefix.

### Other files
`~/.local/share/winezgui/FILENAME.EXE/` include extracted png used in .desktop file, .desktop file needed to launch the exe, and bash script which is executed by .desktop file and can be run from command line also.  

### Shortcuts/desktop files of WineZGUI
`~/usr/share/applications/winezgui.desktop` - main

### Launching the shortcut runs a script and presents a GUI with Options to:
    1. Run the EXE Program
    2. Open Shell (with env set WINEPREFIX=~/.local/share/winezgui/EXE_NAME)
    3. Launch Explorer++ to run windows exe files by exploring the filesystem.
    4. Launch Winetricks - to add additional wine addons/components
    5. Allows installing Multiple winetricks verbs in one go like "dotnet35 xna31 xact vcrun2005" etc. instead of one by one.
    6. Backing up the Prefix for later use.
    7. Deleting the Prefix (not the exe file)
    8. Kill Running Instances

## Install WineZGUI

### Setup on Flatpak supported Distros (This is best)
Please install `flatpak-builder` in your system before running these commands
```
git clone https://github.com/fastrizwaan/WineZGUI.git
cd WineZGUI/flatpak-manifest
./install.sh
```
flatpak's optional requirement is `gnome-terminal` if we need to access prefix using shell

### SETUP on normal linux system / non flatpak install

```
git clone https://github.com/fastrizwaan/WineZGUI.git
cd WineZGUI
sudo ./setup --install ; #systemwide
```
### Uninstall WineZGUI
```
sudo ./setup --uninstall
```

## Requirements
`wine` - main program
`winetricks` - must have wine addon script
`perl‑image‑exiftool` - to extract application/game name
`icoutils` - to extract icon from exe file
`gnome-terminal` - (optional) to access prefix directory in shell


## Install Requirement for your Linux OS
### Fedora 36
`sudo dnf install wine winetricks perl-Image-ExifTool icoutils gnome-terminal`

### Debian / Ubuntu
```
sudo dpkg --add-architecture i386
sudo apt install wine winetricks libimage-exiftool-perl icoutils gnome-terminal
```
### Solus
```
sudo eopkg it wine winetricks perl-image-exiftool icoutils gnome-terminal
```

