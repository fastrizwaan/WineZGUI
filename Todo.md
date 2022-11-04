0.90
- [ ] Comment every script, what it does
- [x] Shortcuts
    - [x] Create
      - Create Script file with New EXE Name,
      - Create Icon file, and desktop file
      - Create Prefix should create shortcut!
    - [ ] Delete
    - [ ] Restore...
    - [ ] Restore all Shorctus (.desktop files)
    - [ ] Delete All Shortcuts
- [ ] New Function
     - [ ] WineZGUI_Import_Wine_Prefix => Winezgui_Identity_Remove then Winezgui_Identity_Restore
     - [ ] Steps
           - [ ] Ask to select Directory
           - [ ] Copy that directory to Prefixes_Dir
           - [ ] Determine old user; Old_user=$(grep \"USERNAME\"=\"${USER}\" ${1}/user.reg|cut -f2 -d "="|sed "s/\"//g")
           - [ ] Determine New User; new_user=${USER}
           - [ ] Determine wine arch 32/64 (grep "#arch=" system.reg|cut -f2 -d "="); see winezgui-template-change
           - [ ] Find exe files inside wine-prefix, ask to select main exe
           - [ ] Ask wehter to create shortcuts for remaining exe files? Create rest exe shortcuts
     - [ ] set main exe
     - [ ] create shortcut

0.89.3
- [ ] Add shortcuts using [x] check boxes

0.89.2
- [ ] Prefix Template Downloads
     - [ ] Download templates from github
     - [ ] WineZGUI-win64-UE4 (mf-install)
     - [ ] WineZGUI-win32-UE4

0.89.2
- [ ] If wine version changes (compared to metada (Settings.yml)) inform user esp. for system install (startup-checks)

0.89.1
- [ ] Set Compression Level in Settings.yml and use that. Reduce 1 more dialog

0.89.0
- [x] CMDLINE for exe, wine ${EXE} ${CMDLINE}
      - [x] script-launch check for cmdline.yml, if found, load CMDLINE values
      - [x] create cmdline.yml, using more -> Set Exe Arguments
      - [x] cmdline.yml; cmdline: for script-exe-cmdline

0.88.8
- [x] Remove branding, again :-D "Name (WineZGUI-xx.xx)" -> "Name"
- [x] Restore wzt - Set launch as default, since it was working well, that's why it was created.

0.88.7
- [x] Only Search for Username on Backup and Restore, and not for all

0.88.6
- [x] Winezgui_Identity_Remove: find ${USER} inside drive_c, if found warn after replacement, especially if it is part of path
- [x] ${USER}    -> XOUSERXO  ; find files using $(grep -r "$USER" drive_c/|cut -f1 -d ":"|sort -u)
- [x] Winezgui_Identity_Restore: find XOUSERXO and replace it with $USER



0.88.5
- [x] Do not add branding in Change exe function
- [x] Change Exe Should not Change Prefix

0.88.4
- [x] Do not put branding (WineZGUI-xxx) to Program Name

0.88.3
- [x] Fix line-edit names with weird characters. (warn)
- [x] Rename Functions
     - [x] WineZGUI_Backup_Function    -> Winezgui_Identity_Remove
     - [x] WineZGUI_Restore_Function   -> Winezgui_Identity_Restore
     - [x] WineZGUI_Restore_Process_Xo -> Winezgui_Identity_Restore_All
     
0.88.2
- [x] fix more-help missing file 

0.88.1
- [x] Backup_Function should check whether files got processed before tar (grep XO Info.yml *.sh)
- [x] Fix info.txt use by info.txt->Info.yml in create-prefix

0.88
- [x] clone template prefix (Copy prefix)
- [x] Improve Backup and Restore code before release
-     Check backup/restore with
- [x] flatpak->system 
- [x] system ->flatpak
- [x] user1 => user2
- [x] both flatpak and system install for user1, user2 and user3 should work on restore
- [x] Launch setup.exe/install.exe and ask to set default exe
- [x] setup/installer -> remove found_exe_files so that user is prompted always
- [x] Change Prefix Exe (exe+icon+prefix)
- [x] Icon only
- [x] Fix Backup_and_Restore_Functions
- [x] make sure both prefix and templates are back up
- [x] Fix Template - Backup - sed not working
- [x] Rewrite winezgui to fix Opening, exe, cancelling, reopening other exe quits winezgui
- [x] Do not show uninstallers in Change Exe and runtime like vcrun etc.
- [x] If name contains Setup or Install, ask to change exe after launch
- [x] found Installed exe dialog height based on no. of exe found (wc -l found-exe-files.yml)
- [x] Modularize even more, every script file be used as function
- [x] 80 column rules
- [x] Set as direct launch, winezgui find and delete direct-launch.txt to enable disable
- [x] New Menu Layout
- [x] Show Names instead of Prefix name (grep Name:|cut -f2)
- [x] Show Template in USE in about
- [x] Move Templates and Shortcuts inside Configure
- [x] Beautify Scripts
- [x] Add / Remove Shortcuts ... proper place More
- [x] Templates... Fix delete etc..
- [x] Installer Support
- [x] Template Support (basic)
- [x] Change Exe
- [x] Change Icon from exe too
- [x] Backup do not double include gamedir when it is inside prefixdir
- [x] Use GAMEDIR instead of bundled_game directory for Game Bundle.
- [x] Use wzt-info.yml
- [x] Speed up wzt-info.yml extraction from wzt file by putting it on the top of
      archive. Breaks backward compatibility.
- [x] Use info.yml for info file instead of Info.yml
- [x] About use Info.yml
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
- [x] fix templates select, create, delete, rename, clone

0.87 
- [x] No Release

0.86.1
- [x] Fix Project64-3.0.1.5664-2df3434_0.1 Repeating
      Name->Name-anything will repeat -anything...
      Name->NEWNAME->Name-anything might fix
      Rather, directly change EXE_FILE=.* and EXE_PATH= in script
      Game Name: and Game Directory: in Info.yml and .desktop file

0.86
- [x] Restore question dialog should present wzt-info on loading .wzt file
- [x] Handle user cancel of prefix name, extraction of wzt file


0.85
- [x] Game Bundle, Ask compression Level, defaults to "zstd -10"
- [x] use "zstd -T0" to detect no. of cpu cores
- [x] Remove --gui and --force in winetricks-cli script
- [x] Change Game-Bundle and Prefix-Backup naming (do not use date)
- [x] Include flatpak name in wzt-Info.yml on backup/bundle creation

0.84
- [x] Launch script instead of launching game
- [x] Create Bundle (include gamedir along with prefix) using Backup
- [x] Create and add wzt-Info.yml to get info on restoring .wzt file
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
