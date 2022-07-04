### Naming used

`WineZGUI` - Application Name uses case sensitive "WineZGUI"
 `winezgui` - Rest all use "winezgui" for Directory name Bash script (without .sh), Icon, Application shortcut (.desktop) file etc., for ease of typing

### Directories of WineZGUI

`~/.local/share/winezgui/` - It's like root directory where wineprefixes are created `~/.local/share/winezgui/default/` - default wine prefix to test / install exes `~/.local/share/winezgui/FILENAME.EXE/` - user created wine prefix for selected exe, and holds .desktop file, icon file, and script to run exe with wine with this wine prefix.

### Scripts of WineZGUI

`/usr/bin/winezgui` - main bash script (program) to handle exe files `~/.local/share/winezgui/FILENAME.EXE/FILENAME.sh` - prefix specific shell script to launch exe associated with this wine prefix.

### Other files

`~/.local/share/winezgui/FILENAME.EXE/` include extracted png used in .desktop file, .desktop file needed to launch the exe, and bash script which is executed by .desktop file and can be run from command line also.

### Shortcuts/desktop files of WineZGUI

`~/usr/share/applications/winezgui.desktop` - main

### Launching the shortcut runs a script and presents a GUI with Options to:

```
1. Run the EXE Program
2. Open Shell (with env set WINEPREFIX=~/.local/share/winezgui/EXE_NAME)
3. Launch Explorer++ to run windows exe files by exploring the filesystem.
4. Launch Winetricks - to add additional wine addons/components
5. Allows installing Multiple winetricks verbs in one go like "dotnet35 xna31 xact vcrun2005" etc. instead of one by one.
6. Backing up the Prefix for later use.
7. Deleting the Prefix (not the exe file)
8. Kill Running Instances
```
