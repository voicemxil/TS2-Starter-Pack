!include LogicLib.nsh
!macro setLanguage gameKey
	SetRegView 32
  	System::Call 'kernel32::GetSystemDefaultLangID() i .r7' 	
	Pop $R7	
	DetailPrint "Detected Language: $7" 
	${If} $7 == 1033 ; English
	${OrIf} $7 == 4105
	${OrIf} $7 == 7177
	${OrIf} $7 == 8201
	${OrIf} $7 == 9225
	${OrIf} $7 == 10249
	${OrIf} $7 == 11273
	${OrIf} $7 == 12297
	${OrIf} $7 == 13321
	${OrIf} $7 == 14345
	${OrIf} $7 == 15369
	${OrIf} $7 == 16393
	${OrIf} $7 == 17417
	${OrIf} $7 == 18441
		DetailPrint "Game Language = English"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "1"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "English US"
	${ElseIf} $7 == 1036 ; French
	${OrIf} $7 == 2060
	${OrIf} $7 == 3084
	${OrIf} $7 == 4108
	${OrIf} $7 == 5132
	${OrIf} $7 == 6156
	${OrIf} $7 == 7180
	${OrIf} $7 == 8204
	${OrIf} $7 == 9228
	${OrIf} $7 == 10252
	${OrIf} $7 == 11276
	${OrIf} $7 == 12300
	${OrIf} $7 == 13324
	${OrIf} $7 == 14348
	${OrIf} $7 == 15372
	${OrIf} $7 == 58380
		DetailPrint "Game Language = Fremch"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "2"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "French"
	${ElseIf} $7 == 1031 ; German
	${OrIf} $7 == 2055
	${OrIf} $7 == 3079
	${OrIf} $7 == 4103
	${OrIf} $7 == 5127
		DetailPrint "Game Language = German"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "3"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "German"
	${ElseIf} $7 == 1040 ; Italian
	${OrIf} $7 == 2064
		DetailPrint "Game Language = Italian"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "4"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Italian"
	${ElseIf} $7 == 1034 ; Spanish
	${OrIf} $7 == 2058 ; Spanish (Mexico)
	${OrIf} $7 == 3082
	${OrIf} $7 == 4106
	${OrIf} $7 == 5130
	${OrIf} $7 == 6154
	${OrIf} $7 == 7178
	${OrIf} $7 == 8202
	${OrIf} $7 == 9226
	${OrIf} $7 == 10250
	${OrIf} $7 == 11274
	${OrIf} $7 == 12298
	${OrIf} $7 == 13322
	${OrIf} $7 == 14346
	${OrIf} $7 == 15370
	${OrIf} $7 == 16394
	${OrIf} $7 == 17418
	${OrIf} $7 == 18442
	${OrIf} $7 == 19446
	${OrIf} $7 == 20490
	${OrIf} $7 == 21514
	${OrIf} $7 == 58378
		DetailPrint "Game Language = Spanish"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "5"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Spanish"
	${ElseIf} $7 == 1053 ; Swedish
	${OrIf} $7 == 2077
		DetailPrint "Game Language = Swedish"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "6"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Swedish"
	${ElseIf} $7 == 1031 ; Finnish
		DetailPrint "Game Language = Finnish"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "7"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Finnish"
	${ElseIf} $7 == 1043 ; Dutch
	${OrIf} $7 == 2067
		DetailPrint "Game Language = Dutch"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "8"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Dutch"
	${ElseIf} $7 == 1049 ; Russian
	${OrIf} $7 == 2073
		DetailPrint "Game Language = Russian"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "10"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Russian"
	${ElseIf} $7 == 2052 ; Chinese (Simplified)
	${OrIf} $7 == 4100
		DetailPrint "Game Language = Chinese (Simplified)"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "11"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Chinese (Simplified)"
	${ElseIf} $7 == 1028 ; Chinese (Traditional)
	${OrIf} $7 == 3076
	${OrIf} $7 == 5124
		DetailPrint "Game Language = Chinese (Traditional)"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "12"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Chinese (Traditional)"
	${ElseIf} $7 == 1049 ; English (UK)
	${OrIf} $7 == 3081
	${OrIf} $7 == 5129
	${OrIf} $7 == 6153
		DetailPrint "Game Language = English (UK)"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "13"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "English (UK)"
	${ElseIf} $7 == 1049 ; Polish
		DetailPrint "Game Language = Polish"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "14"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Polish"
	${ElseIf} $7 == 1054 ; Thai
		DetailPrint "Game Language = Thai"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "15"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Thai"
	${ElseIf} $7 == 1044 ; Norwegian
	${OrIf} $7 == 2068
		DetailPrint "Game Language = Norwegian"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "16"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Norwegian"
	${ElseIf} $7 == 2070 ; Portuguese
		DetailPrint "Game Language = Portuguese"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "17"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Portuguese"
	${ElseIf} $7 == 1038 ; Hungarian
		DetailPrint "Game Language = Hungarian"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "18"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Hungarian"
	${ElseIf} $7 == 1046 ; Portuguese (Brazil)
		DetailPrint "Game Language = Portuguese (Brazil)"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "a"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Portuguese (Brazil)"
	${ElseIf} $7 == 1029 ; Czech
		DetailPrint "Game Language = Czech"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "b"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Czech"
	${ElseIf} $7 == 1037 ; Hebrew	
		DetailPrint "Game Language = Hebrew"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "c"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Hebrew"
	${ElseIf} $7 == 1032 ; Greek
		DetailPrint "Game Language = Greek"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "d"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Greek"
	${ElseIf} $7 == 1041 ; Japanese
		DetailPrint "Game Language = Japanese"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "e"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Japanese"
	${ElseIf} $7 == 1042 ; Korean
		DetailPrint "Game Language = Korean"
		WriteRegDWORD HKLM32 "Software\${gameKey}\1.0" "Language" "f"
		WriteRegStr HKLM32 "Software\${gameKey}\1.0" "LanguageName" "Korean"			
	${EndIf}
!macroend