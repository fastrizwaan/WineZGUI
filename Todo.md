###### Todo

0.90

- [ ] Create Prefix using setup file, should turn that prefix to game/app specific prefix (gog setup prefix -> game prefix) - rename prefix, directory. find desktop file, lnk etc. for the renaming



0.81

- [x] Include Appstream Metadata

- [x] Retore work with filename containing numbers

- [x] backup / restore work with different flatpak versions (flatpak-wine5, flatpak-wine7, flatpak-WineZGUI)
  
  

0.80

- [x] Backup Restore Support

- [x] Launch Game after Restoring Backup

0.5

- [x] mf-install support (needed for Unreal Engine 4 games) for wine stable 5 and 7, included as mf-install script

- [x] Perhaps create and send a verb to winetricks instead with video proof

- [x] Runtime test of dependency by winezgui, create-prefix, and launch-script

0.6

- [ ] Support Gamedir install (give option, gamedir preferred if writable)
  
  - [ ] Create wine prefix inside game directory, for backup up and sharing with friends
    
    - [ ] if it is on read only block device, use ~/.var or ~/.local to create prefix
    
    - [ ] give option to choose install location, either same directory or ~/.var / ~/.local
    
    - [ ] Handling exe launch with different prefix dirs
      
      - [ ] on launch, check subdir in 
      
      - [ ] game dir - for gamedir install if found launch
      
      - [ ] else WINEZPREFIX/NO_EXE dir

- [ ] Change prefix location support, from gamedir to somewhere else and vice versa
  
  - [ ] give 2 option, to gamedir or custom location
  
  - [ ] if from gamedir only show other location

- [ ] Backup should store metadata like, wine version and prefix and gamedir, and exe md5sum (to find later on the filesystem)

- [ ] Backup  Restore: Backup should support (for system install, for flatpak, and prefix in ~/.var or ~/.local or game dir).

- [ ] a wizard to restore is better?  
  
  - [ ] on restore, check metadata and inform user, if exe not found, ask user to select or search for the exe, use md5sum to verify same exe.
  
  - [ ] if game dir, link shortcut from gamedir to applications

- [ ] if wine version changes (compared to metada) inform user 

- [ ] 
