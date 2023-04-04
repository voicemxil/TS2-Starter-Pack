!macro touchup gameTitle gameKey gameGUID gameEXE
	DetailPrint "Touching Up ${gameTitle}..."
	WriteRegStr HKLM32 "Software\${gameKey}" "CacheSize" "4735180800"
		Pop $3
		DetailPrint "CacheSize Registry: $3"
	WriteRegStr HKLM32 "Software\${gameKey}" "DisplayName" "${gameTitle}"
		Pop $3
		DetailPrint "DisplayName Registry: $3"
 	WriteRegStr HKLM32 "Software\${gameKey}" "EPsInstalled" "Sims2EP1.exe,Sims2EP2.exe,Sims2EP3.exe,Sims2SP1.exe,Sims2SP2.exe,Sims2EP4.exe,Sims2EP5.exe,Sims2SP4.exe,Sims2SP5.exe,Sims2EP6.exe,Sims2SP6.exe,,Sims2EP7.exe,Sims2SP7.exe,Sims2SP8.exe,Sims2EP8.exe,Sims2EP9.exe,,,"
		Pop $3
		DetailPrint "EPsInstalled Registry: $3"
	WriteRegStr HKLM32 "Software\${gameKey}" "Folder" "$INSTDIR"
		Pop $3
		DetailPrint "Folder Registry: $3"
	WriteRegStr HKLM32 "Software\${gameKey}" "Install Dir" "$INSTDIR\Double Deluxe\Base"
		Pop $3
		DetailPrint "Install Dir Registry: $3"
	WriteRegStr HKLM32 "Software\${gameKey}" "Product GUID" "${GameGUID}"
		Pop $3
		DetailPrint "Product GUID Registry: $3"
	WriteRegStr HKLM32 "Software\${gameKey}" "Region" "14726"
		Pop $3
		DetailPrint "Region Registry: $3"
	WriteRegStr HKLM32 "Software\${gameKey}" "Registration" "SOFTWARE\Electronic Arts\EA Games\The Sims 2 Ultimate Collection\ergc"
		Pop $3
		DetailPrint "Registration Registry: $3"
	WriteRegStr HKLM32 "Software\${gameKey}" "Suppression Exe" "Sims2EP9.exe,Sims2EP8.exe,Sims2EP7.exe,Sims2SP7.exe,Sims2SP6.exe,Sims2EP6.exe,Sims2SP5.exe,Sims2SP4.exe,Sims2EP5.exe,Sims2EP4.exe,Sims2SP2.exe,Sims2SP1.exe,Sims2EP3.exe,Sims2EP2.exe,Sims2EP1.exe,Sims2.exe"
		Pop $3
		DetailPrint "SwapSize Registry: $3"
	WriteRegStr HKLM32 "Software\${gameKey}" "SwapSize" "0"
		Pop $3
		DetailPrint "SwapSize Registry: $3"


	WriteRegStr HKLM32 "Software\${gameKey}\1.0" "DisplayName" "${gameTitle}"
		Pop $3
		DetailPrint "DisplayName Registry #2: $3"
	WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "1"
		Pop $3
		DetailPrint "Language Registry: $3"
	WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "English US"
		Pop $3
		DetailPrint "LanguageName Registry: $3"


WriteRegStr HKLM32 "Software\EA GAMES\The Sims 2 Fun with Pets Collection" "" ""
		Pop $3
		DetailPrint "Fun with Pets Registry: $3"
	WriteRegDWORD HKLM32 "Software\EA GAMES\The Sims 2 Fun with Pets Collection\1.0" "Language" "1"
		Pop $3
		DetailPrint "Language Registry: $3"
	WriteRegStr HKLM32 "Software\EA GAMES\The Sims 2 Fun with Pets Collection\1.0" "LanguageName" "English US"
		Pop $3
		DetailPrint "LanguageName Registry: $3"

	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\${gameEXE}" "" "$INSTDIR\Fun with Pets\SP9\TSBin\Sims2EP9.exe"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\${gameEXE}" "Game Registry" "Software\EA GAMES\The Sims 2 Fun with Pets Collection"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\${gameEXE}" "Installed" "1"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\${gameEXE}" "Restart" "0"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\${gameEXE}" "Path" "$INSTDIR\${gameTitle}\SP9"

	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2.exe" "" "$INSTDIR\Double Deluxe\Base\TSBin\Sims2.exe"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2.exe" "Game Registry" "Software\${gameKey}"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2.exe" "Installed" "1"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2.exe" "Restart" "0"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2.exe" "Path" "$INSTDIR\Double Deluxe\Base"

	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP1.exe" "" "$INSTDIR\University Life\TSBin\Sims2EP1.exe"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP1.exe" "Game Registry" "Software\EA GAMES\The Sims 2 EP1"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP1.exe" "Installed" "1"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP1.exe" "Restart" "0"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP1.exe" "Path" "$INSTDIR\University Life\EP1"

	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP2.exe" "" "$INSTDIR\Double Deluxe\EP2\TSBin\Sims2EP2.exe"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP2.exe" "Game Registry" "Software\EA GAMES\The Sims 2 EP2"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP2.exe" "Installed" "1"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP2.exe" "Restart" "0"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP2.exe" "Path" "$INSTDIR\Double Deluxe\EP2"

	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP3.exe" "" "$INSTDIR\Best of Business\EP3\TSBin\Sims2EP3.exe"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP3.exe" "Game Registry" "Software\EA GAMES\The Sims 2 EP3"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP3.exe" "Installed" "1"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP3.exe" "Restart" "0"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP3.exe" "Path" "$INSTDIR\Best of Business\EP3"

	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP4.exe" "" "$INSTDIR\Fun with Pets\EP4\TSBin\Sims2EP4.exe"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP4.exe" "Game Registry" "Software\EA GAMES\The Sims 2 EP4"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP4.exe" "Installed" "1"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP4.exe" "Restart" "0"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP4.exe" "Path" "$INSTDIR\Fun with Pets\EP4"

	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP5.exe" "" "$INSTDIR\Seasons\TSBin\Sims2EP5.exe"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP5.exe" "Game Registry" "Software\EA GAMES\The Sims 2 Seasons"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP5.exe" "Installed" "1"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP5.exe" "Restart" "0"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP5.exe" "Path" "$INSTDIR\Seasons"

	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP6.exe" "" "$INSTDIR\Bon Voyage\TSBin\Sims2EP6.exe"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP6.exe" "Game Registry" "Software\EA GAMES\The Sims 2 Bon Voyage"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP6.exe" "Installed" "1"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP6.exe" "Restart" "0"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP6.exe" "Path" "$INSTDIR\Bon Voyage"

	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP7.exe" "" "$INSTDIR\Free Time\TSBin\Sims2EP7.exe"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP7.exe" "Game Registry" "Software\EA GAMES\The Sims 2 Free Time"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP7.exe" "Installed" "1"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP7.exe" "Restart" "0"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP7.exe" "Path" "$INSTDIR\Free Time"

	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP8.exe" "" "$INSTDIR\Apartment Life\TSBin\Sims2EP8.exe"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP8.exe" "Game Registry" "Software\EA GAMES\The Sims 2 Apartment Life"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP8.exe" "Installed" "1"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP8.exe" "Restart" "0"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP8.exe" "Path" "$INSTDIR\Apartment Life"

	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP1.exe" "" "$INSTDIR\Fun with Pets\SP1\TSBin\Sims2SP1.exe"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP1.exe" "Game Registry" "Software\EA GAMES\The Sims 2 SP1"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP1.exe" "Installed" "1"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP1.exe" "Restart" "0"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP1.exe" "Path" "$INSTDIR\Fun with Pets\SP1"

	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP2.exe" "" "$INSTDIR\Glamour Life Stuff\TSBin\Sims2SP2.exe"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP2.exe" "Game Registry" "Software\EA GAMES\The Sims 2 Glamour Life Stuff"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP2.exe" "Installed" "1"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP2.exe" "Restart" "0"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP2.exe" "Path" "$INSTDIR\Glamour Life Stuff"

	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP4.exe" "" "$INSTDIR\Double Deluxe\SP4\TSBin\Sims2SP4.exe"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP4.exe" "Game Registry" "Software\EA GAMES\The Sims 2 SP4"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP4.exe" "Installed" "1"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP4.exe" "Restart" "0"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP4.exe" "Path" "$INSTDIR\Double Deluxe\SP4"

	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP5.exe" "" "$INSTDIR\Best of Business\SP5\TSBin\Sims2SP5.exe"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP5.exe" "Game Registry" "Software\EA GAMES\The Sims 2 SP5"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP5.exe" "Installed" "1"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP5.exe" "Restart" "0"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP5.exe" "Path" "$INSTDIR\Best of Business\SP5"

	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP6.exe" "" "$INSTDIR\University Life\SP6\TSBin\Sims2SP6.exe"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP6.exe" "Game Registry" "Software\EA GAMES\The Sims 2 SP6"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP6.exe" "Installed" "1"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP6.exe" "Restart" "0"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP6.exe" "Path" "$INSTDIR\University Life\SP6"

	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP7.exe" "" "$INSTDIR\Best of Business\SP7\TSBin\Sims2EP7.exe"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP7.exe" "Game Registry" "Software\EA GAMES\The Sims 2 Best of Business Collection"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP7.exe" "Installed" "1"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP7.exe" "Restart" "0"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP7.exe" "Path" "$INSTDIR\Best of Business\SP7"

	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP8.exe" "" "$INSTDIR\University Life\SP8\TSBin\Sims2SP8.exe"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP8.exe" "Game Registry" "Software\EA GAMES\The Sims 2 University Life Collection"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP8.exe" "Installed" "1"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP8.exe" "Restart" "0"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP8.exe" "Path" "$INSTDIR\University Life\SP8"

	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\Uninstall\${gameTitle}" "DisplayName" "${gameTitle}"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\Uninstall\${gameTitle}" "FolderName" "$INSTDIR"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\Uninstall\${gameTitle}" "UninstallString" "$\"$INSTDIR\Uninstall The Sims 2 Starter Pack.exe$\""
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\Uninstall\${gameTitle}" "DisplayIcon" "$\"$INSTDIR\${gameTitle}\TSBin\${gameEXE}$\""
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\Uninstall\${gameTitle}" "Publisher" "osab / EA"
!macroend