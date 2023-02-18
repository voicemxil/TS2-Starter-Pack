!macro touchup gameTitle gameKey gameGUID gameEXE
	DetailPrint "Touching Up ${gameTitle}..."
	WriteRegStr HKLM32 "Software\${gameKey}" "CacheSize" "4735180800"
		Pop $3
		DetailPrint "CacheSize Registry: $3"
	WriteRegStr HKLM32 "Software\${gameKey}" "DisplayName" "${gameTitle}"
		Pop $3
		DetailPrint "DisplayName Registry: $3"
	WriteRegStr HKLM32 "Software\${gameKey}" "Folder" "$INSTDIR"
		Pop $3
		DetailPrint "Folder Registry: $3"
	WriteRegStr HKLM32 "Software\${gameKey}" "Install Dir" "$INSTDIR"
		Pop $3
		DetailPrint "Install Dir Registry: $3"
	WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "1"
		Pop $3
		DetailPrint "Language Registry: $3"
	WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "English US"
		Pop $3
		DetailPrint "LanguageName Registry: $3"
	WriteRegStr HKLM32 "Software\${gameKey}" "Product GUID" "${GameGUID}"
		Pop $3
		DetailPrint "Product GUID Registry: $3"
	WriteRegStr HKLM32 "Software\${gameKey}" "Region" "14726"
		Pop $3
		DetailPrint "Region Registry: $3"
	WriteRegStr HKLM32 "Software\${gameKey}" "SwapSize" "0"
		Pop $3
		DetailPrint "SwapSize Registry: $3"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\${gameEXE}" "Game Registry" "${gameKey}"
	WriteRegDWORD HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\${gameEXE}" "Installed" "1"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\App Paths\${gameEXE}" "Path" "$INSTDIR\${gameTitle}"

	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\Uninstall\${gameTitle}" "DisplayName" "${gameTitle}"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\Uninstall\${gameTitle}" "FolderName" "$INSTDIR"
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\Uninstall\${gameTitle}" "UninstallString" "$\"$INSTDIR\Uninstall ${gameTitle} Starter Pack.exe$\""
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\Uninstall\${gameTitle}" "DisplayIcon" "$\"$INSTDIR\${gameTitle}\TSBin\${gameEXE}$\""
	WriteRegStr HKLM32 "Software\Microsoft\Windows\CurrentVersion\Uninstall\${gameTitle}" "Publisher" "osab / EA"
!macroend