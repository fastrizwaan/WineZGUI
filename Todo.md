###### Todo
NEW
- [x] New Menu Layout
- [x] Show Names instead of Prefix name (grep Name:|cut -f2)
- [x] Show Template in USE in about
- [x] Shortcuts
    - [x] Create
      - Create Script file with New EXE Name,
      - Create Icon file, and desktop file
      - Create Prefix should create shortcut!
    - [ ] Delete
    - [ ] Restore...
    - [ ] Delete All Shortcuts
- [x] Move Templates and Shortcuts inside Configure
- [ ] Beautify Scripts
- [ ] Improve Backup and Restore code before release

- [ ] Add / Remove Shortcuts ... proper place?
- [ ] Templates... Fix delete etc..

0.92

0.91
- [ ] WineZGUI recipe support
    - [ ] URL
    - [ ] Image
    - [ ] EXE
    - [ ] wine version
    - [ ] winetricks
    - [ ] Arch
    - [ ] Playonlinux -> wzt-install?
    - [ ] Create wzt-install script from existing install.
         POL_Shortcut "7zFM.exe" "$TITLE" "" "" "Archiving;"
         https://www.playonlinux.com/en/app-373-7Zip.html

0.90
- [ ] Prefix Management (prefixes with winetricks and registry customizations)
  - Default Prefix
  - WineZGUI default (mf-install)
  - Unreal Engine 4 Prefix
  - Old Games Midi Supported

0.89
- [ ] if wine version changes (compared to metada) inform user esp. for system install
- [ ] Do not show uninstallers in Change Exe and runtime like vcrun etc.
- [ ] If name contains Setup or Install, create Installer prefix
- [ ] Use 7 char sha256sum of setup/installer exe for prefixdir name
- [ ] found Installed exe dialog height based on no. of exe found (wc -l found-exe-files.yml)
- [ ] clone prefix from script itself
  - [ ] Basically Copy prefix, i.e., Change EXE (with cp without mv)
- [ ] wzt management
    - [ ] Split
        - [ ] Number or Parts
        - [ ] Size of Parts
    - [ ] Join
    - [ ] Extract wzt (unplayable)
    - [ ] Extract and restore wzt (playable)
    - [ ] Change Compression Level

0.88
- [ ] Fix Backup_and_Restore_Functions
- [ ] make sure both prefix and templates are back up
- [ ] Fix Template - Backup - sed not working
- [x] Rewrite winezgui to fix
  - [x] winezgui:  Opening, exe, cancelling, reopening other exe quits winezgui
- [x] Modularize even more, every script file be used as function
- [x] 80 column rules
- [x] Comment every script, what it does
- [x] Set as direct launch, winezgui find and delete direct-launch.txt to enable disable

0.87
- [x] Installer Support
- [x] Template Support (basic)
- [x] Change Exe
- [x] Change Icon from exe too
- [x] Backup do not double include gamedir when it is inside prefixdir
- [x] Use GAMEDIR instead of bundled_game directory for Game Bundle.
- [x] Use wzt-info.yml
- [x] Speed up wzt-info.yml extraction from wzt file by putting it on the top of
      archive. Breaks backward compatibility.
- [x] Use info.yml for info file instead of info.txt
- [x] About use info.yml
- [x] Use column to format info.yml like restore-wzt does
- [x] Change Exe update info.yml
- [x] After Installer, if new exe's are found
      - [x] Show Change EXE
      - [x] update name in desktop file
      - [x] Change Icon from exe when changing exe
      - [x] do no prompt change icon when run from changing exe
      - [x] sed ${PREFIXDIR} value to variable ${PREFIXDIR} in found-exe-files.yml
      - [x] If prefix do not have any installed exe, show error message
      - [x] Rename/Change Prefix Directory on changing exe
      - [x] Change EXE path in Info.yml
      - [x] Existing directory, add name duplicate/prefixdir to desktop file
      - [x] Open Other EXE, allow Installed and non installed exe to run
      - [x] winezgui-change-installed-exe and script-find-installed-exe
      - [x] Script name and Function Name must be same. Script smallcase, Function CAPITALCASE
- [x] Find and remove Installer Created desktop shortcuts from wine directory
      grep -r "$WINEPREFIX" ~/.local/share/applications/wine/|cut -f1 -d ":"|sort -u
- [x] Sort found exe list before presenting
- [x] script-locate-exe-function: use | instead of / sed FIXME
- [x] copy default to create-prefixdir then run winezgui-create-prefix
- [x] About.yml should be at winezprefix
- [ ] fix templates select, create, delete, rename, clone

0.86.1
- [x] Fix Project64-3.0.1.5664-2df3434_0.1 Repeating
      Name->Name-anything will repeat -anything...
      Name->NEWNAME->Name-anything might fix
      Rather, directly change EXE_FILE=.* and EXE_PATH= in script
      Game Name: and Game Directory: in info.txt and .desktop file

0.86
- [x] Restore question dialog should present wzt-info on loading .wzt file
- [x] Handle user cancel of prefix name, extraction of wzt file


0.85
- [x] Game Bundle, Ask compression Level, defaults to "zstd -10"
- [x] use "zstd -T0" to detect no. of cpu cores
- [x] Remove --gui and --force in winetricks-cli script
- [x] Change Game-Bundle and Prefix-Backup naming (do not use date)
- [x] Include flatpak name in wzt-info.txt on backup/bundle creation

0.84
- [x] Launch script instead of launching game
- [x] Create Bundle (include gamedir along with prefix) using Backup
- [x] Create and add wzt-info.txt to get info on restoring .wzt file
- [x] Use faster zstd instead of gzip
- [x] use APPNAME-VERSION in Title

0.83
- [x] Rename Prefix
- [x] Associate wzt mimetype with WineZGUI backup filename
- [x] Mimetype support
- [x] Open WineZGUI backup .wzt from argument and from Restore... option
- [x] Change icon name to io.github.fast.rizwaan.WineZGUI.svg
- [x] Change .desktop file name to io.github.fastrizwaan.WineZGUI.desktop

0.82
Backup and Restore with Multi user
- [x] flatpak -> system
- [x] flatpak -> flatpak
- [x] system -> system
- [x] system -> flatpak
- [x] backup from user A / restores with user B and vice versa


0.81
- [x] Include Appstream Metadata
- [x] Restore work with filename containing numbers
- [x] backup / restore work with different flatpak versions (flatpak-wine5, flatpak-wine7, flatpak-WineZGUI)



0.80
- [x] Backup Restore Support
- [x] Launch Game after Restoring Backup

0.5
- [x] mf-install support (needed for Unreal Engine 4 games) for wine stable 5 and 7, included as mf-install script
- [x] Perhaps create and send a verb to winetricks instead with video proof
- [x] Runtime test of dependency by winezgui, create-prefix, and launch-script
