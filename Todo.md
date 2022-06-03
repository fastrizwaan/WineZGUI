###### Todo

Version 0.3

- [ ] gnome-terminal launch  (if fails)|| show need gnome terminal msg
  
  - [ ] winezgui flashing gnome-terminal window is annoying

- [ ] Show WineZGUI version (use version variable)

- [ ] Create shortcut should show --entry-text and ask to confirm to fix game name, on creation

- [ ] mf-install support (needed for Unreal Engine 4 games) for wine stable 5 and 7

- [ ] 
- [ ] Runtime test of dependency by winezgui, create-prefix, and launch-script

- [ ] Generate  metadata file inside prefix 

- [ ] Show prefix information, prefix, game directory, size (du), date of install, wine version used,  exe sha256sum etc.
  
      Metadata:
  
  - [ ] Game Name
  
  - [ ]  sha256sum, 
  
  - [ ] filename,
  
  - [ ]  gamdir location (EXE_PATH) and
  
  - [ ]  prefix and 
  
  - [ ] wine version 
  
  - [ ] winezgui version, 
  
  - [ ] icon

- [ ]  Support Gamedir install (give option, gamedir preferred if writable)
  
  - [ ] Create wine prefix inside game directory, for backup up and sharing with friends
    
    - [ ] if it is on read only block device, use ~/.var or ~/.local to create prefix
    
    - [ ] give option to choose install location, either same directory or ~/.var / ~/.local
    
    - [ ] Handling exe launch with different prefix dirs
      
      - [ ] on launch, check subdir in 
      
      - [ ] game dir - for gamedir install if found launch
      
      - [ ]  else WINEZPREFIX/NO_EXE dir

- [ ] Change prefix location support, from gamedir to somewhere else and vice versa
  
  - [ ] give 2 option, to gamedir or custom location
  
  - [ ] if from gamedir only show other location

- [ ] Backup should store metadata like, wine version and prefix and gamedir, and exe md5sum (to find later on the filesystem)

- [ ] Backup  Restore: Backup should support (for system install, for flatpak, and prefix in ~/.var or ~/.local or game dir).

- [ ] a wizard to restore is better?  
  
  - [ ] on restore, check metadata and inform user, if exe not found, ask user to select or search for the exe, use md5sum to verify same exe.
  
  - [ ] if game dir, link shortcut from gamedir to applications

- [ ]  if wine version changes (compared to metada) inform user 

- [ ] 
