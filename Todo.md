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
      - [ ] Open Other Exe (directplay, setup like ubisoft installer)flatpak install --user https://dl.flathub.org/build-repo/72058/io.mpv.Mpv.flatpakref
      - [ ] Delete
      - [ ] Restore prefix
      - [ ] Import and run
      - [ ] Delete
      - [ ] Restore bundle
      - [ ] run   
  
  [ ] After Recreate All Scripts, do all tests

0.98.3-99
- show menu for importing wine directory
      - [] Import Wine Directory from
      Detect and List the directories from path into the menu
      - Bottles (Flatpak)
      - Lutris  (Flatpak)
      - Playonlinux (Flatpak)
        - System
        - Flatpak
      
- arch is already taken care of by the wine directory's registry files.
- [] import wine directory, include runner from
      - [] bottles
          - [] if wine directory contains bottles.yml (grep "Runner:"bottles.yml)
          - [] find grepped runner at ~/.var/app/com.usebottles.bottles/data/bottles/runners
          - [] copy the runner to prefixdir
          - [] change WINE_CMD to prefixdir/runners/runner(ge-proton8-25)/files/bin/wine
          
      - [] playonlinux
        - [] just copy the wine directory as it only supports upto 7.22
      - [] lutris
0.99.0
- [] Support Runner
- [] WineZGUI Main window
      - [] Create "Runners" similar to Template if not found 
      - [] Settings-> Runner...
            - [] Set Runner (wine) [use Settings->Prefix Template]
                  - [] Open Other EXE like, list installed
            - [] Import a runner

Use Info.yml to set runner, it could be absolute path, change full path to $HOME

Game->Change->Runner...

grep "Runner:"from Info.yml

if no Runner Specified, do not include anything

if Runner is specified, set Runner: 

Select Runner directory, look for Runner/bin/wine inside runner

if basename="wine" or "wine64"
runner=fullpath of wine/wine64
fi

Runner check
1. Runners/Dirname -> get Runners/Dirname/bin/wine
2. Runner/Dirname/bin -> get Runners/Dirname/bin/wine
3. Runners/Dirname/bin/wine -> use it
4. Runners/Dirname/bin/wine64 -> use it


find all files with wine_cmd and include them for runner vscode

backup-bundle should include runner if runner is specified in Info.yml

WineZGUI->Settings->Set runner (show runners subdirectory list) else ask the user to download/copy runners from bottles or use proton-up to download runners or kron4

0.99.0
- [] Change Winezgui menu to:
     Open Exe...
     Scripts...
     Prefixes...
     Game Bundle...
     Shortcuts...
     Runners...	
     Templates...
     Settings...
     Kill...
     Help...
     About...
     Quit...

0.98.6.5
- [] When creating a prefix/game bundle, copy the runner into the prefixdir 
     - [] script-backup-bundle
     - [] script-backup-prefix
     - [] different runner, change Info.yml to point Runner to PREFIXDIR/Runner directory

- [] When restoring, copy the runner to RUNNERS_DIR else keep it 
     - [] check if runner exists in RUNNERS_DIR, if found do not copy, else copy the runner

     
0.98.6.2 (runner support) 
set
-[x] WINE_CMD
-[x] WINEVER 
-[x] RUNNER and get runner from winezgui-set-wine_cmd-runner-commands in
-[x] RUNNERNAME
-[x]
     - [x] winezgui  
     - [x] winezgui-create-prefix 
     - [x] winezgui-recreate-prefix-script 
     - [x] script-create-other-shortcuts
- [x] Delete Selected Runner
- [x] Confirm, WINE_CMD, WINEVER, RUNNER, RUNNERNAME works both for flatpak or script
- [x] Bug: deleting another runner and setting System Default, won't update winever, because WineVer is used before RUNNER is assigned in 
    -[x] list-available-runners
      -[x] problem: 
           SHOW_OPTION+=" "
           # Setting 1st option as default wine
           NAMES+=("System Default")
           FILES+=("$(which wine)")
      - [x] $(which wine) fails from script (but flatpak run --command=${RUNNER} io.github.fastrizwaan.WineZGUI)
      - [x] Set SYSTEM_WINE=$(which wine) in winezgui
      - [x] flatpak run --command=${SYSTEM_WINE} io.github.fastrizwaan.WineZGUI in scriptfile
      - [x] and use 
    -[x] script-launch

    -[] BUG: winever and runner not updating of EXE_Info.yml (Infofile = Info.yml, but it should also update current EXE_Info.yml)
    - [x] Setting System Default won't work, why?
- [] 0.98.5.1
     - [] bug with sheepoo restore (/var/home/rizvan/.var/app/io.github.fastrizwaan.WineZGUI/data/winezgui/Prefixes/setup_sheepo_sheepo1.1_(53923)-563828eadc)
- [x] create winezgui-runner-help
- [x] create winezgui-runner-set-default
- [x] create winezgui-runner-import
- [x] create winezgui-runner-download
    - [x] Kron4ek Wine Latest
      WINEBUILDS=$(curl -s https://api.github.com/repos/Kron4ek/Wine-Builds/releases/latest|grep browser_download_url|grep tar|cut -f2- -d ":"|sed "s|\"||g")
      for i in $WINEBUILDS ; do echo $i; done|head -n1
    - [x] Kron4ek wine-9.0
      WINEBUILDS=$(curl -s https://api.github.com/repos/Kron4ek/Wine-Builds/releases|grep browser_download_url|grep tar|cut -f2- -d ":"|sed "s|\"||g")
      for i in $WINEBUILDS ; do echo $i; done|grep -i wine-9.0|head -n1
    - [x] Kron4ek wine-8.0
      WINEBUILDS=$(curl -s https://api.github.com/repos/Kron4ek/Wine-Builds/releases|grep browser_download_url|grep tar|cut -f2- -d ":"|sed "s|\"||g")
      for i in $WINEBUILDS ; do echo $i; done|grep -i wine-8.0|head -n1

    - [x] Kron4ek wine-proton (latest)
         WINEBUILDS=$(curl -s https://api.github.com/repos/Kron4ek/Wine-Builds/releases|grep browser_download_url|grep tar|cut -f2- -d ":"|sed "s|\"||g")
         wget $(for i in $WINEBUILDS ; do echo $i; done|grep -i proton|head -n1)
   - [x] Kron4ek needs dxvk and vkd3d
    - [x] not including lutris-GE-Proton-GE (wine-ge-proton)
         WINEGE=$(curl -s https://api.github.com/repos/GloriousEggroll/wine-ge-custom/releases/latest |grep browser_download_url|grep tar|cut -f2- -d ":"|sed "s|\"||g")
  
- [x] create winezgui-runner-backup
- [-] create winezgui-runner-restore (needs supporting zip files), 
- [x] restore-runner, ask whether to change runner?
- [x] investigate why script-launch WINE_CMD is different from RUNNER
     -[x] using workaround of settings WINE_CMD="${RUNNER}" till the investigation
- [x] create winezgui-runner-delete

- [x] add winezgui->settings->runner menu
- [x] create file winezgui-runner to list options
- [x] Create RUNNER_NAME variable from system or foldername of the runner name 
     if [ $(basename ${RUNNER}} = "wine" ] || if [ $(basename ${RUNNER}} = "wine64" ]; then
          RUNNER_NAME="$(basename $(dirname $(dirname ${RUNNER})))"
     fi
- [x] RUNNER_NAME in winezgui
- [x] RUNNER NAME in winezgui-create-prefix
- [x] RUNNER NAME in winezgui-recreate-prefix-script 
- [x] RUNNER NAME in script-create-other-shortcuts
- [x] update files having WINE_CMD with RUNNER variables (using WINE_CMD global search)
- [x] winezgui  
- [x] winezgui-create-prefix 
- [x] winezgui-recreate-prefix-script 
- [x] script-create-other-shortcuts

- [x] Add RUNNERS_DIR and RUNNER variable based on use by winezgui or script (using PREFIXES_DIR global search)
- [x] winezgui
- [x] winezgui-create-prefix 
- [x] winezgui-recreate-prefix-script 
- [x] script-create-other-shortcuts


- [x] add runner info to About.yml
- [x] Update About.yml for runner (grep Runner, not found, change Wine: -> Wine Runner:)
- [x] Update About.yml for runner on change by Settings, use winezgui-template-change (search If About.yml is writable)

- [x] add both runner and runner_name to About.yml
- [x] update runner_name and version on change of runner

- [x] use Info.yml get RUNNER info into recreated scripts 
- [x] recreate-prefix-script 
- [x] script-create-other-shortcuts


- [x] BUG: updated script using default wine is not updating runner information. perhaps wine_cmd=$runner is missing
- [x] wine_cmd to use runner from Settings.yml
- [x] Locate runner, if not found, update with default runner, else use RUNNER=grep from settings.yml
- [x] settings->runner...->Set Wine Runner...

- x[] systemwide - winezgui
     - [x] Set runner (for all new prefixes)
       - [x] Settings.yml -> runner: fullpath to runner
         
     - [x] Find runner and copy runner from other apps like dolphin, heroic launcher
     - [x] Use wine-proton which uses system's dxvk and vkd3d (do winetricks dxvk vkd3d (or make it default for 0.98.6 for both wine and proton)
     - 
- [] scriptwise
     - [x] Change runner
         - [] Check for dxvk & vkd3d in winetricks.log
         - [x] bug: change runner does not update Info.yml's wine version. fixme.
         - [x] Get list of runners from WINEZGUIDIR/Runners and let user select one
         - [] If not found use the winezgui-find-runners function to list runners, let user use it directly or import runner to Runners directory.
         - [x] Choose Change runner for this script only or for all scrpts inside $PREFIXDIR
         - [x] Change Info.yml or *.yml based on user's selection
         - [] On launch check for runner existing or not, if not found tell user that it's gone, shall we use another runner or default one?
         - [] backup prefix/bundle should import runner
 - [] Import wine directory, should import runner from bottles, heroic launcher, lutris (read config files and copy)
 - [] If no runner is found, ask whether to download
0.98.5
- [x] create tmp directory for winetricks to work
- [x] fix winetricks issue (path)
- [x] fix minor bugs

0.98.4
- [x] Do not wineboot -u if runner is used or when runner is not having wineboot
- [x] if wineboot is not found in the runner do not use wineboot (proton-ge)
- [x] do not show cancel button for progress bar for username and xouserxo

0.98.3
- [x] allow --filesystem=bottles, playonlinux, phoenicis, wine TAKE FROM pronton-up-qt manifest
     for import wine directory and runners
     -- get --filesystem wine prefix for various apps
       - bottles
       - heroic launcher
       - playonlinux
       - phonicis
       - lutris

- [x] reduce 1 dialog to import directory.

0.98.2
 - [x] exe inside prefix dir then name the wzt: game-bundle instead of prefix-backup

0.98.1

0.98.0
- [x] add exe folder like putty or gw3.exe and check whether it creates new shortcuts? not creating
- [x] install wzt and update and test
- [x] TEST IMPORT AND INSTALL OF EXE and IMPORT GAMEDIR and WINE DIR import
- [x] import wine directory with single exe
- [x] import wine directory with multiple exe
- [and scriptfilex] create prefix with single EXE
- [x] import game dir into prefix (single exe) (gw3.exe)
- [x] imort game dir with multiple exes (gw3.exe + putty directory)
- [x] create prefix with installer (single exe) (backpack hero)
- [x] create prefix with installer (multipe exes) (putty)

- [x] prefix dir should have sha10chars suffix for prefixdir 
- [x] delete script and desktoo file for setup/installer only (use if to check for setup and install)
- [x] only delete script file for installer/setup to remove setup shortcut after install to reduce clutter
- [] Add help for missing modules

- [x] On cancelling import wine directory return, do not throw error for system.reg
- [x] Reduce Backup name from 
     Game-WineZGUI-0.97.15-Game-Bundle-flatpak-WineZGUI-2023-11-23_1551.wzt to
     Game-WineZGUI-0.97.15-Game-Bundle-2023-11-23_1551.wzt
     for both bundle and prefix
-[x] do not delete script and desktop file for import-wine-directory

0.97.16
- [x] Import Wine directory (from wine/playonlinux/bottles/etc.)
      - [x] import directory
      - [x] find exe files and create shortcuts
            script-create-shortcuts-for-found-exes

      - [x] ask user to select .wine or other wine directory (playonlinux/bottles)
      - [x] Check Registry files present or not (no registry means not a wine directory)
      - [x] Find Exes in the selected directory to be used as prefix name
      - [x] Copy selected wine to Prefixes_dir with the selected_exe_name
      - [x] Get exe path starting from drive_c from the import_dir (%drive_c)
      - [x] find selected exe from the prefixes_dir (as copied from import_dir) to create scriptfile
      - [x] Use winezgui-create-prefix without folder creation to create all imp. files like scriptfile, Info.yml, settings.yml etc.
      - [x] after creation of directory specific scriptfile, Create shortcuts for found exes

0.97.15
- [x] Fix Create Shortcuts for missing files
      - [x] Create .desktop file based on sh files.
      - [x] list all exe files, 
            - [x] Check missing exe from script files, then suggest
            - [x] Select Exe to create shortcut 
      - [x] Open Other Exe can create shortcut, which allows other exe to be imported into an existing prefix

0.97.14.2
- [x] Fixed Delete .desktop file and restore from .bak file
- [x] Delete Shortcut, create a backup .desktop.bak file
- [x] Restore Shortcut, list *.bak files and let the user restore it.


0.97.14
- [x] Allow Environment Variables for some older games.

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
