!macro RemovePreviousInstall
    SetRegView 32
    ClearErrors
    EnumRegKey $0 HKLM32 "SOFTWARE\EA GAMES\The Sims 2" 0
IfErrors keydontexist keyexists
goto noo
keyexists:
        ReadRegStr $R4 HKLM32 "SOFTWARE\EA GAMES\The Sims 2" "Folder" 
        MessageBox MB_YESNO|MB_ICONEXCLAMATION "A previous installation of The Sims 2 was detected on this system. Leaving behind remnants in the registry can cause unwanted behavior. Would you like the installer to remove the conflicting installation?$\n$\nWARNING: this will remove the game files at '$R4' as well as registry keys we detected, rendering the old installation unplayable. Your save file directories will not be affected." IDYES si IDNO noo
si:
            ReadRegStr $R4 HKLM32 "SOFTWARE\EA GAMES\The Sims 2" "Folder" 
            RMDir /r $R4
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2"
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 Apartment Life"
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 Bon Voyage"
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 Celebration Stuff"
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 Family Fun Stuff"
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 FreeTime"
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 Glamour Life Stuff"
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 H M Fashion Stuff"
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 IKEA Home Stuff"
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 Kitchen & Bath Interior Design Stuff"
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 Mansion and Garden Stuff"
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 Nightlife"
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 Open For Business"
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 Pets"
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 Seasons"
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 Teen Style Stuff"
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 University"
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 Best of Business Collection"    
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 University Life Collection"
            DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 Fun with Pets Collection"
            DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\The Sims 2 Starter Pack"
            DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2.exe"	
            DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP1.exe"	
            DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP2.exe"	
            DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP3.exe"	
            DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP4.exe"	
            DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP5.exe"	
            DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP6.exe"	
            DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP7.exe"
            DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP8.exe"	
            DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP9.exe"
            DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2SC.exe"
            DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP1.exe"	
            DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP2.exe"	
            DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP4.exe"	
            DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP5.exe"	
            DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP6.exe"	
            DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP7.exe"
            DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP8.exe"	
            goto noo
keydontexist:
        #key doesn't exist
        DetailPrint "No prior installations were detected. Yay!"
noo:
!macroend