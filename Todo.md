- [ ] Comment every script, what it does
- [ ] Comment who will be calling this current script/function and why
- [ ] Create Flow Chart

- [ ] New Function
  - [ ] WineZGUI_Import_Wine_Prefix => Winezgui_Identity_Remove then Winezgui_Identity_Restore
  - [ ] Steps
    
        - [ ] Ask to select Directory
        - [ ] Copy that directory to Prefixes_Dir
        - [ ] Determine old user; Old_user=$(grep \"USERNAME\"=\"${USER}\" ${1}/user.reg|cut -f2 -d "="|sed "s/\"//g")
        - [ ] Determine New User; new_user=${USER}
        - [ ] Determine wine arch 32/64 (grep "#arch=" system.reg|cut -f2 -d "="); see winezgui-template-change
  - [ ] Determine New User; new_user=${USER}
  - [ ] RNAME\"=\"${USER}\" ${1}/user.reg|cut -f2 -d "="|sed "s/\"//g")

- [ ] TEST Complete these

- [ ] System Install
  
      - [ ] Create Game Prefix with direct play exe
      - [ ] Launch 2-3 times after exiting app. works?
      - [ ] Create Prefix Backup for testing
      - [ ] Create Game Bundle
      - [ ] Import Gamedir into prefix
      - [ ] Launch 2-3 times, works?
      - [ ] Change Name
      - [ ] Change Icon
      - [ ] Change Prefix Dir name
      - [ ] Open Other Exe (directplay, setup like ubisoft installer)
      - [ ] Delete
      - [ ] Restore prefix
      - [ ] Import and run
      - [ ] Delete
      - [ ] Restore bundle
      - [ ] run

- [ ] Test across flatpak<->system wzt prefix and bundle support
  
      - [ ] Restore flatpak Prefix and Run
      - [ ] Restore flatpak Bundle and Run
      - [ ] Backup/Restore save game and test

- [ ] Flatpak WineZGUI
  
      - [ ] Restore System Prefix and Run
      - [ ] Restore System Bundle and Run
      - [ ] Create Game Prefix with direct play exe
      - [ ] Launch 2-3 times after exiting app. works?
      - [ ] Create Prefix Backup for testing
      - [ ] Create Game Bundle
      - [ ] Import Gamedir into prefix
      - [ ] Launch 2-3 times, works?
      - [ ] Change Name
      - [ ] Change Icon
      - [ ] Change Prefix Dir name
      - [ ] Open Other Exe (directplay, setup like ubisoft installer)
      - [ ] Delete
      - [ ] Restore prefix
      - [ ] Import and run
      - [ ] Delete
      - [ ] Restore bundle
      - [ ] run   
  
  [ ] After Recreate All Scripts, do all tests


0.97.13
- [x] Do not delete drive_c/users/${USER}/Temp directory (fixes kao the kangaroo error)
- [x] Create "${PREFIXDIR}/drive_c/users/${USER}/Temp" as if not present.

0.96.xxx

- [ ] work with read only host --filesystem=host:ro
- [ ] offer to import gamedir (by checking sizes)

0.96

- [ ] switch to filename=function name, script-launch=script-launch instead of Script_Launch
- [ ] upgrade existing scripts to new naming scheme, in all prefixes

0.95.0 - 0.95.9

- [ ] check variable assignment show error on failure, output to log file
- [ ] check sed replacement show error on failure, output to log file
- [ ] check all files and directories whether they are readable/writable before working with them
- [ ] check all links creation 
- [ ] check all dir creation (check if -d, dir already found, not creating, check read/write permission -if -r -w)
- [ ] for flatpak-spawn to kill/open shell/open terminal, show user the command 
- [ ] gnome-terminal, if not found, show the command
- [ ] update all scripts (recreate all scripts) of all prefixes More->Update all exe scripts to WineZGUI Current Version
- [ ] mini scripts, will they also get properly updated?

0.96.0-9
rename all files to function name in smallcase like:

- [ ] eg: SOURCE "script-check-variables-loaded-or-not"
  
          Script_Check_Variables_Loaded_Or_Not() -> script-check-variables-loaded-or-not()
- [ ] recreate all prefixes for latest version, it is a must.
- [ ] Do rigourous test with old version and new version

- [?] use function check, if not found, try older version using alias eval

- [ ] cancel should kill winetricks in flatpak/system
- [ ] .bak file should include old winezgui version
- [ ] open cli in terminal (winetricks a b c d e f g)
- [ ] check a script for older version, if it is older, ask once to update?

0.96.2
- [x] unlink before linking to $HOME
- [x] use ${ZENITY_CMD} instead of zenity for silverblue or host not having zenity installed

0.96.1

- [x] Use generic-package icon instead of winezgui icon.

- [x] Do not install winezgui.svg mime icon using setup.sh



0.96.0

- [x] Clean up
  - [x] various bug fixes
  - [x] recreate all prefixes for latest version
  
  - [x] rename all files to function name in smallcase like:
  
  
  eg: SOURCE "script-check-variables-loaded-or-not"



0.95.9

Recreate-Prefix-Script: use existing sha256sum from script file, useful when file is not accessible and user recreates prefix script

- [x] - [x] winetricks: backup *.reg files before running winetricks, so that user can restore if required.

0.94.9

- [x] fix setup not creating shortcuts (after switching to ~/.local/share/applications)

0.94.8

- [ ] Remove ~/.local/share/applications/winezgui/* from all scripts (DESKTOPDIR)

0.94.7

- [x] fix open other exe

0.94.4

- [x] use ~/.local/share/applications directory for shortcut symlinks for instant update
- [x] Open Other Exe -> Any Other exe show, create script with current prefix
- [x] do not touch scripts with _other.sh when recreating all scripts

0.94.3

- [x] use app category from .desktop file
  #- [ ] use ~/.local/share/applications for shortcuts links with app_winezg
  ui.desktop
  0.94.0
- [x] if Gamedir or EXE_FILE is not found, skip Backup Game Bundle

0.93.9

- [x] open terminal from winezgui-more fix
- [x] Recreate All Scripts -> Ask whether to use existing Shorcut Name and Icon
- [x] Add PATH=${PATH}:/app/bin in launch script, flatpak with --host or --home uses ~/.bashrc PATH, which is a bug, ahem feature
- [x] Reduce Winetricks Cli 
  
      VERB_LIST="mfc42 xact xact_x64 gmdls \
                vcrun2003 vcrun2005        \
                vcrun2008 vcrun2010        \
                vcrun2019 faudio           \
                quartz avifil32 corefonts"

0.93.6

- [x] revert 0.93.5 --norc does not work with bash -c

0.93.5

- [x] flatpak run --norc command=bash (use --norc to avoid reading .bashrc)
- [x] skip cls-lolz*.exe, cls-srep*.exe

0.93.4

- [x] Template - DotNet48-Wine8 = mfc42 xact xact_x64 xinput gmdls xna31 vcrun2003 vcrun2005 vcrun2008 vcrun2010 vcrun2019 dotnet48 faudio corefonts

0.93.3

- [x] export PATH and WTRICKS_CMD and WINETRICKS variables for winetricks to work.

0.93.2

- [x] do not create shortcuts for python.exe pythonw.exe zsync.exe zsyncmake.exe
- [x] Use latest winetricks from winezguidir

0.93.1

- [x] PREFIXNAME=$(basename $PREFIXDIR) (recreate-all-scripts), fixes backup after recreated scripts

0.93

- [x] Remove winetricks as runtime dependency
- [x] Remove  WINEDLLOVERRIDES, let user install mono and gecko (mshtml)

0.92.8

- [x] Create About.yml if not found
- [x] Update wine version on about, and launch
- [x] Remove extra debug messages

0.92.7

- [x] Use nice 20 (least priority) for extraction
- [x] Recreate all scripts, use PREFIXNAME same as basename $PREFIXDIR

0.92.6

- [x] Fix Recreate-All-Scripts

0.92.5

- [x] Fix Launch PROGNAME with spaces

0.92.4

- [x] Fix list scripts not listing script names with symbols like ( or )

0.92.3

- [x] update menus and icon cache after removing shortcuts after setup launch
- [x] rename winezgui-recreate-prefix to winezgui-recreate-prefix-scripts
- [x] Do not show exe not found dialog in Script_Create_Shortcuts_For_Found_Exes for directplay exe

0.92.2

- [x] use ${INFOFILE} variable instead of ${PREFIXDIR}/Info.yml
- [x] do not re-create scripts from find new exe for games bundled in GAMEDIR (skip gamedir from exe search)

0.92.1

- [x] Update wine using sed regex

0.92

- [x] Update WineZGUI-More help
- [x] Show Directory path beside size in Prefix and Bundle backup
- [x] Update winetricks
- [x] Download winetricks to ${WINEZGUIDIR}, 
- [x] On 1st run, check if winetricks is available, if ask download latest from github
- [x] WineZGUI->More show update winetricks script

0.91.1

- [x] mfc42
- [x] add debug to check and fix du -sh and df -h output empty value, -z backup->game bundle fails when gamedir is not inside 
- [x] On restore do not do repair xoxo->$user
- [x] WineZGUI->More->Repair-> Recreate Scripts and Restore Identity (Fix Scripts with XOXO)

0.91

- [x] Import/Copy Gamedir inside sandbox/prefix
- [x] df, du issue fix
- [x] other bug fixes

0.90.12

- [x] Allow ~ @ # $ % ^ etc symbols for file and directory names

0.90.11

- [x] While creating bundle/prefix backup, suggest PRODUCT NAME instead of PREFIXNAME as filename

0.90.9

- [x] unset TEXT, to fix dialog showing previous dialog's data
- [x] Update Script help

0.90.8

- [x] Use system's tar and zstd if found, to backup/save
- [x] revert 0.90.6-7
- [x] Add \n to prompt

0.90.7

- [x] Fix && with || to check write permission.

0.90.6

- [x] Prompt user to give portal access to system for kill, open terminal
- [x] Check no write access to the target directory on backup/save using touch

0.90.5

- [x] fix ${ZENITY_CMD} --error message for flatpak-spawn

0.90.4

- [x] Ask user to allow flatpak system access for kill and open terminal
- [x] Use df instead of mount to find mounted partitions
- [x] Change Category run update icon cache, desktop database.
- [x] mf-install use wget and tar directly instead of $WGET_CMD and $TAR_CMD
- [x] use wget instead of WGET_CMD in Template Download
- [x] Remove broken links after deleting setup's .desktop file
- [x] Flathub requirements (io.github.fastrizwaan.WineZGUI)
- [x] Disable --talk-name=org.freedesktop.Flatpak
- [x] Read only access to filesystem --filesystem=host:ro

0.90.3

- [x] Detect PREFIXDIR/FILES_WITH_USERNAME.txt, if found only then do a XOUSERXO -> $user conversion of the files
- [x] Remove setup's script file after creating shortcuts
- [x] show debug variable messages to be removed after flatpak variable issues are resolved.
- [x] change all zenity, wget to $ZENITY_CMD and WGET_CMD

0.90.2

- [x] exe with same name (e.g., setup.exe), check sha256sum, create new prefix if dissimilar
- [x] use double quotes for all source ${} and if [ ${} ]

0.90.1

- [x] fix winrar launch by unquoting "${EXE_ARGUMENTS}"
- [x] Skip winrar exes like unrar.exe RarExtInstaller.exe Rar.exe
- [x] Delete drive_c/users/$user/Temp directory after install

0.90 

- [x] flatpak install use tools from using flatpak --command
- [x] Use exiftool, icotool, zenity, tar and wget from flatpak. Silverblue does not have them installed.
- [x] Use ${HOME} insetad of /home/${user}. Needed for silverblue's $HOME is at /var/home and not at /home.

0.89.16

- [x] Flatpak: if datadir/file is found use it, else use from winezgui-scripts dir

0.89.15

- [x] Flatpak: use winezgui-scripts dir for flatpak created script running from system that needs winezgui-* scripts

0.89.14

- [x] for flatpak use $WINE_CMD --version instead of wine --version 

0.89.13

- [x] bug fix, wine version always mismatch

0.89.12

- [x] Remove Set Saved Game directory...
- [x] More->Set Launch Behavior-> directly/script

0.89.11

- [x] Sha256sum check for Template Download

0.89.10

- [x] Save/Load...
     -[x] Save...
     -[x] Restore...
     -[x] PREFIXNAME-DATE_TIME_save.tar.zst

0.89.9

- [x] Recreate Scripts with current winezgui version (both downgrade and upgrade)
- [x] for i in *.sh; do grep EXE_FILE -$i; winezgui-recreate-script $i; done
- [x] winezgui-recreate-script should use same prefixdir, same name

0.89.8

- [x] Script Delete - useful for prefix with multiple exes / scripts
  - [x] Shortcut
  - [x] Script
  - [x] Prefix

0.89.7

- [x] Show list of multiple exe installed after setup
- [x] default script should show all the available scripts/exe to launch
- [x] restore works with script which lists multiple exe and single 

0.89.6

- [x] Create all desktop shortcuts for one or more found exe after setup
- [x] Delete Setup/Installer script after creating shortcuts
- [x] Restore Multiple .desktop files
- [x] Revert Direct Launch on restore wzt
- [x] After Setup, show the list of exe script files to launch for multiple exe found
- [x] After Setup, launch the single script created
- [x] Shortcuts
  - [x] Create
    - [x] Create Script file with New EXE Name,
    - [x] Create Icon file, and desktop file
    - [x] Create Prefix should create shortcut!

0.89.5

- [x] Show progress for template Download
- [x] Show Tempaltes Change after extraction

0.89.4

- [x] Prefix Template Downloads
  - [x] Download templates from github
  - [x] WineZGUI-win64-UE4 (mf-install)
  - [x] Fix delete Template

0.89.3

- [x] Do not prompt to change user->xouser in drive_c
- [x] Fix identity removal and restoration on backup

0.89.2

- [x] If wine version changes (compared to metada (Info.yml)) inform user esp. for system install (startup-checks)
  
      -[x] Script_Launch function, check wine version.
      -[x] script file should check, compare wine versin in Info.yml and $(which wine)

0.89.1

- [x] Set Debug default
- [x] Remove shortcuts from wine directory only if it exists and writable.

0.89.0

- [x] CMDLINE for exe, wine ${EXE} ${CMDLINE}
  
      - [x] script-launch check for cmdline.yml, if found, load CMDLINE values
      - [x] create cmdline.yml, using more -> Set Exe Arguments
      - [x] cmdline.yml; cmdline: for script-exe-cmdline
      - [x] Set Exe Argument working

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
  - [x] WineZGUI_Restore_Process_Xo -> WineZGUI_Identity_Restore_All

0.88.2

- [x] fix more-help missing file 

0.88.1

- [x] Backup_Function should check whether files got processed before tar (grep XO Info.yml *.sh)
- [x] Fix info.txt use by info.txt->Info.yml in create-prefix

0.88

- [x] clone template prefix (Copy prefix)
- [x] Improve Backup and Restore code before release

-  Check backup/restore with

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
