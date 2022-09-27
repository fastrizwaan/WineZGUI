- [ ] Templates
     -[ ] New...
     -[ ] Clone...
     -[ ] Rename...
     -[ ] Delete...
     -[ ] Backup...
     -[ ] Restore...
     
 
- [ ] Settings
     -[x] Set Wine Arch...
     -[x] Set Prefix Template...
     -[ ] Configure ${TEMPLATE_NAME}...
     -[ ] Set Launch Behavior...
          (use $LAUNCH variable)
          if [ file Launch.yml exists] launch
          Settings.yml
          
     -[ ] Help

- Create Settings directory in WINEZGUIDIR
- Put 
  - WineArch.yml
  - Launch.yml
  - Template.yml

# Use Settings.yml instead of separate files.  
cat > Settings.yml
Arch:win32
Template:WineZGUI-win32
Launch:True


Script -> Settings
file: Launch.yml
if found launch, else Show Script Window

future
ADD Wine apps...
[ ] wine Regedit
[ ] wine taskmgr
[ ] wine cmd
[ ] wine uninstaller
[ ] wine control
[ ] wine winhelp

