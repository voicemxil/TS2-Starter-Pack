!macro RemovePreviousInstall
SetRegView 32
ClearErrors
${GetGameRegKey} $R4
IfErrors keydontexist keyexists
goto noo
keyexists:
MessageBox MB_YESNO|MB_ICONEXCLAMATION "A previous installation of The Sims 2 was detected on this system. Leaving behind remnants in the registry can cause unwanted behavior. Would you like the installer to remove the conflicting installation?$\n$\nWARNING: this will remove the registry keys we detected, rendering the old installation unplayable. Your game/save file directories will not be affected." IDYES si IDNO noo
si:
${DeleteGameRegKey}
MessageBox MB_YESNO|MB_ICONEXCLAMATION "Would you like to remove the game files the old registry keys pointed to at: '$R4'? (Save files will not be removed, only game files.)" IDYES yassdelete IDNO done
yassdelete:
Delete "$R4*.*"
RMDir "$R4"
done:
goto done

Function GetGameRegKey
Exch $0 ; return value
Push "SOFTWARE\EA GAMES\The Sims 2"
Call ReadRegStr $0 HKLM32
Pop $1
StrCmp $0 "" 0 +2 ; if $0 is empty, skip two lines
StrCpy $0 $1
FunctionEnd

Function DeleteGameRegKey
Push "SOFTWARE\EA GAMES\The Sims 2"
${GetGameRegKey} $0
DeleteRegKey HKLM32 $0
${DeleteExpansionRegKey} "Apartment Life"
${DeleteExpansionRegKey} "Bon Voyage"
${DeleteExpansionRegKey} "Celebration Stuff"
${DeleteExpansionRegKey} "Family Fun Stuff"
${DeleteExpansionRegKey} "FreeTime"
${DeleteExpansionRegKey} "Glamour Life Stuff"
${DeleteExpansionRegKey} "H M Fashion Stuff"
${DeleteExpansionRegKey} "IKEA Home Stuff"
${DeleteExpansionRegKey} "Kitchen & Bath Interior Design Stuff"
${DeleteExpansionRegKey} "Mansion and Garden Stuff"
${DeleteExpansionRegKey} "Nightlife"
${DeleteExpansionRegKey} "Open For Business"
${DeleteExpansionRegKey} "Pets"
${DeleteExpansionRegKey} "Seasons"
${DeleteExpansionRegKey} "Teen Style Stuff"
${DeleteExpansionRegKey} "University"
${DeleteExpansionRegKey} "Best of Business Collection"
${DeleteExpansionRegKey} "University Life Collection"
${DeleteExpansionRegKey} "Fun with Pets Collection"
${DeleteUninstallRegKey} "The Sims 2 Starter Pack"
${DeleteAppPathRegKey} "Sims2.exe"
${DeleteAppPathRegKey} "Sims2EP1.exe"
${DeleteAppPathRegKey} "Sims2EP2.exe
${DeleteAppPathRegKey} "Sims2EP3.exe"
${DeleteAppPathRegKey} "Sims2EP4.exe"
${DeleteAppPathRegKey} "Sims2EP5.exe"
${DeleteAppPathRegKey} "Sims2EP6.exe"
${DeleteAppPathRegKey} "Sims2EP7.exe"
${DeleteAppPathRegKey} "Sims2EP8.exe"
${DeleteAppPathRegKey} "Sims2EP9.exe"
${DeleteAppPathRegKey} "Sims2SC.exe"
${DeleteAppPathRegKey} "Sims2SP1.exe"
${DeleteAppPathRegKey} "Sims2SP2.exe"
${DeleteAppPathRegKey} "Sims2SP4.exe"
${DeleteAppPathRegKey} "Sims2SP5.exe"
${DeleteAppPathRegKey} "Sims2SP6.exe"
${DeleteAppPathRegKey} "Sims2SP7.exe"
${DeleteAppPathRegKey} "Sims2SP8.exe"
