!include LogicLib.nsh
!macro setLanguage gameKey
	SetRegView 32
	SysInfo::GetOperatingSystem_LanguageID
 	Pop $7	
	DetailPrint "Detected Language: $7" 
	${If} $7 == 1033 ; English
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "1"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "English US"
	${ElseIf} $7 == 1036 ; French
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "2"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "French"
	${ElseIf} $7 == 1031 ; German
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "3"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "German"
	${ElseIf} $7 == 1040 ; Italian
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "4"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Italian"
	${ElseIf} $7 == 1034 ; Spanish
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "5"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Spanish"
	${ElseIf} $7 = 2058 ; Spanish (Mexico)
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "5"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Spanish"
	${ElseIf} $7 == 1053 ; Swedish
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "6"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Swedish"
	${ElseIf} $7 == 1031 ; Finnish
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "7"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Finnish"
	${ElseIf} $7 == 1043 ; Dutch
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "8"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Dutch"
	${ElseIf} $7 == 1049 ; Russian
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "10"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Russian"
	${ElseIf} $7 == 2052 ; Chinese (Simplified)
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "11"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Chinese (Simplified)"
	${ElseIf} $7 == 1028 ; Chinese (Traditional)
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "12"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Chinese (Traditional)"
	${ElseIf} $7 == 1049 ; English (UK)
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "13"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "English (UK)"
	${ElseIf} $7 == 1049 ; Polish
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "14"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Polish"
	${ElseIf} $7 == 1054 ; Thai
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "15"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Thai"
	${ElseIf} $7 == 1044 ; Norwegian
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "16"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Norwegian"
	${ElseIf} $7 == 2068 ; Norwegian
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "16"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Norwegian"
	${ElseIf} $7 == 1038 ; Hungarian
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "18"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Hungarian"
	${ElseIf} $7 == 1046 ; Portuguese (Brazil)
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "a"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Portuguese (Brazil)"
	${ElseIf} $7 == 1029 ; Czech
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "b"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Czech"
	${ElseIf} $7 == 1037 ; Hebrew	
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "c"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Hebrew"
	${ElseIf} $7 == 1032 ; Greek
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "d"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Greek"
	${ElseIf} $7 == 1041 ; Japanese
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "e"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Japanese"
	${ElseIf} $7 == 1042 ; Korean
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "f"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Korean"			
	${EndIf}
!macroend