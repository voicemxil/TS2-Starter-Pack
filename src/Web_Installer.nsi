Unicode True ;Support Unicode format in the installer
Target amd64-unicode

;Include header files
!define MUI_WELCOMEFINISHPAGE_BITMAP "..\assets\InstallerImage.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "..\assets\InstallerImage.bmp"
!include "ModernXL.nsh"
!include "MUI2.nsh"
!include "x64.nsh"
!include ".\Downloader.nsh"
!include ".\Language-r.nsh"
!include ".\Touchup-er.nsh"
!include ".\RemovePriorInstallation.nsh"

########################### Installer SETUP
Name "The Sims 2 Starter Pack"
OutFile "..\bin\Web Installer\TS2StarterPack-WebInstaller.v12.x64.exe"
RequestExecutionLevel admin
InstallDir "$PROGRAMFILES32\The Sims 2 Starter Pack"

########################### MUI SETUP
brandingText "osab Web Installer v12"
!define MUI_ABORTWARNING
!define MUI_HEADERIMAGE_BITMAP_STRETCH AspectFitHeight
!define MUI_HEADERIMAGE_BITMAP "..\assets\header.bmp"
!define MUI_ICON "..\assets\NewInstaller.ico"
!define MUI_PAGE_HEADER_TEXT "TS2: Starter Pack - Web Installer"
!define MUI_PAGE_HEADER_SUBTEXT "TS2 Ultimate Collection repacked by osab!"
!define MUI_WELCOMEPAGE_TITLE "osab's Sims 2 Starter Pack"
!define MUI_WELCOMEPAGE_TEXT "Welcome to the Sims 2 Starter Pack Web Installer (v12). Please ensure you have downloaded the latest version from the GitHub! Helpful log messages will be shown in the 'More Details' box."
!define MUI_UNCONFIRMPAGE_TEXT_TOP "WARNING: Before uninstalling, make sure the folder you chose contains ONLY the uninstaller and game files. The game files MUST be in their own separate folder with no other essential data! I am not responsible for any data loss!"
!define MUI_LICENSEPAGE_TEXT_TOP "License Information:"
!define MUI_FINISHPAGE_SHOWREADME "https://docs.google.com/document/d/1UT0HX3cO4xLft2KozGypU_N7ZcGQVr-54QD9asFsx5U/edit#heading=h.6jnaz4t6d3vx"
!define MUI_FINISHPAGE_SHOWREADME_TEXT "Open the next step of the guide (Graphics Setup)?"
!define MUI_FINISHPAGE_NOREBOOTSUPPORT
!define MUI_FINISHPAGE_LINK "TS2 Community Discord Server!"
!define MUI_FINISHPAGE_LINK_LOCATION "https://discord.gg/invite/ts2-community-912700195249197086"
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "..\LICENSE.txt"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_DIRECTORY
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH
!insertmacro MUI_LANGUAGE "English"
##################################### Begin Installation

;Links to Packs
Var AL
Var BoB
Var BV
Var Base
Var DD
Var FT
Var FwP
Var GLS
Var SS
Var UNI

;Current DXVK Version
Var DXVKVER

Function .OnInit
	Dialer::AttemptConnect
	StrCpy $DXVKVER "2.1"
FunctionEnd

InstType "Full (Choose if unsure)" IT_FULL
InstType "AMD Graphics preset" IT_AMD
InstType "Minimal (Linux/WINE optimized)" IT_MIN
	
Section "TS2 Starter Pack" Section1
	SectionInstType ${IT_FULL} ${IT_AMD} ${IT_MIN}
	SectionIn RO 
	SetOutPath $INSTDIR
	SetOverwrite on
	InitPluginsDir
	AddSize 15000000

	!insertmacro RemovePreviousInstall
		
	StrCpy $AL "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v11/SFX_ApartmentLife.v11.exe"
	StrCpy $BoB "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v11/SFX_BestofBusiness.v11.exe"
	StrCpy $BV "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v11/SFX_BonVoyage.v11.exe"
	StrCpy $Base "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v11/SFX_Base.v11.exe"
	StrCpy $DD "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v11/SFX_DoubleDeluxe.v11.exe"
	StrCpy $FT "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v11/SFX_FreeTime.v11.exe"
	StrCpy $FwP "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v11/SFX_FunwithPets.v11.exe"
	StrCpy $GLS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v11/SFX_GlamourLifeStuff.v11.exe"
	StrCpy $SS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v11/SFX_Seasons.v11.exe"
	StrCpy $UNI "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v11/SFX_UniversityLife.v11.exe"
		
	CreateDirectory "$INSTDIR\temp"
	!insertmacro downloadPack "Apartment Life" "$AL" "temp\SFX_ApartmentLife.exe" "4F2D3884B920D985401C785F09E21A1110E3F328190201BE7AA52C1007E1D3C1"
	!insertmacro downloadPack "Best of Business" "$BoB" "temp\SFX_BestofBusiness.exe" "E43D87C76E6DA84B04D52A9672544DE5AEB255422037C97926961F8164A0F480"
	!insertmacro downloadPack "Bon Voyage" "$BV" "temp\SFX_BonVoyage.exe" "11C03EF93DCA19A6F67642311E95DA23E6E7B840749DAA8657013025A40AAA1E"
	!insertmacro downloadPack "Base Game" "$Base" "temp\SFX_Base.exe" "8956EB294E97B1B6FCE0C5C2FBF562079E6645778A4FFC4B19B6B20A02616D11"
	!insertmacro downloadPack "Double Deluxe Packs" "$DD" "temp\SFX_DoubleDeluxe.exe" "7520F68D2B32DA06110E146EB39A2D43439302D217AD088822EA6CF58DD4DC25"
	!insertmacro downloadPack "FreeTime" "$FT" "temp\SFX_FreeTime.exe" "459E8A618A4CA69DD901833E0953CA485DA96698E728994757BC035FCC0B3DF0"
	!insertmacro downloadPack "Fun with Pets" "$FwP" "temp\SFX_FunwithPets.exe" "C1007F5BF8E01B58B63EFB041D3E30AEE0B686C170B408086EB63D8EDC619DF0"
	!insertmacro downloadPack "Glamour Life Stuff" "$GLS" "temp\SFX_GlamourLifeStuff.exe" "A67083B1677BC03E53F1963A5416218D34B3677F550129ABF6502145C01EFD39"
	!insertmacro downloadPack "Seasons" "$SS" "temp\SFX_Seasons.exe" "5F08EFF83F9901CEE8AB11F52AE91DFE4A2C5541C57E10B9C69EE67ED2BE382F"
	!insertmacro downloadPack "University Life" "$UNI" "temp\SFX_UniversityLife.exe" "09D2B04B39F9263F5BF6111C83412D1B22886F36F33C29497F405205C4C6EFF0"

	# Touchup
	DetailPrint "Touching Up..."
	!insertmacro touchup "The Sims 2 Ultimate Collection" "EA GAMES\The Sims 2" "{04450C18-F039-4B81-A621-70C3B0F523D5}" "Sims2EP9.exe"

	# RPC
	!insertmacro downloadPack "Sims2RPC" "https://github.com/voicemxil/TS2-Starter-Pack/raw/v11/components/SFX_Sims2RPC_1.15.exe" "$INSTDIR\temp\SFX_Sims2RPC.exe" "39aa5c91cb584b63fec783db5554c67bf139ca8af13dd297f7cb2bc61056307c"

	RMDir /r "$INSTDIR\temp"

	!insertmacro setLanguage "EA GAMES\The Sims 2" # macro takes in ts2 registry key
	DetailPrint "Adding Language Selection files to game folder..."
	CreateDirectory "$INSTDIR\_Language Selection"
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/Chinese_Simplified.reg" "$INSTDIR\_Language Selection\Chinese_Simplified.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/Chinese_Traditional.reg" "$INSTDIR\_Language Selection\Chinese_Traditional.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/Czech.reg" "$INSTDIR\_Language Selection\Czech.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/Dutch.reg" "$INSTDIR\_Language Selection\Dutch.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/English_UK.reg" "$INSTDIR\_Language Selection\English_UK.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/Finnish.reg" "$INSTDIR\_Language Selection\Finnish.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/French.reg" "$INSTDIR\_Language Selection\French.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/German.reg" "$INSTDIR\_Language Selection\German.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/Greek.reg" "$INSTDIR\_Language Selection\Greek.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/Hebrew.reg" "$INSTDIR\_Language Selection\Hebrew.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/Hungarian.reg" "$INSTDIR\_Language Selection\Hungarian.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/Italian.reg" "$INSTDIR\_Language Selection\Italian.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/Japanese.reg" "$INSTDIR\_Language Selection\Japanese.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/Korean.reg" "$INSTDIR\_Language Selection\Korean.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/Norwegian.reg" "$INSTDIR\_Language Selection\Norwegian.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/Polish.reg" "$INSTDIR\_Language Selection\Polish.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/Portuguese_Brazil.reg" "$INSTDIR\_Language Selection\Portuguese_Brazil.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/Russian.reg" "$INSTDIR\_Language Selection\Russian.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/Spanish.reg" "$INSTDIR\_Language Selection\Spanish.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/Swedish.reg" "$INSTDIR\_Language Selection\Swedish.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v11/components/language-selection/Thai.reg" "$INSTDIR\_Language Selection\Thai.reg" /BACKGROUND /END

	DetailPrint "Creating Downloads folder..."
	CreateDirectory "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads" 
	WriteUninstaller "$INSTDIR\Uninstall The Sims 2 Starter Pack.exe"
SectionEnd
	
Section "Graphics Rules Maker" Section2
	SectionInstType ${IT_FULL} ${IT_AMD} ${IT_MIN}

	CreateDirectory "$INSTDIR\temp"
	${If} ${RunningX64}
		DetailPrint "Downloading Graphics Rules Maker..."
		NScurl::http GET "https://www.simsnetwork.com/files/graphicsrulesmaker/graphicsrulesmaker-2.0.0-64bit.exe" "$INSTDIR\temp\grm_install.exe" /RESUME /INSIST /CANCEL /END
		Pop $0 # return value = exit code, "OK" means OK
		DetailPrint "GRM download status: $0. Executing installer..." 
		ExecWait "grm_install.exe"
	${Else}
		DetailPrint "Downloading Graphics Rules Maker.."
		NScurl::http GET "https://www.simsnetwork.com/files/graphicsrulesmaker/graphicsrulesmaker-2.0.0-32bit.exe" "$INSTDIR\temp\grm_install.exe" /RESUME /INSIST /CANCEL /END"
		Pop $0 # return value = exit code, "OK" means OK
		DetailPrint "GRM download status: $0. Executing installer..." 
		ExecWait "grm_install.exe"
	${EndIf}
	Execwait $INSTDIR\temp\grm_install.exe
	Delete $INSTDIR\temp\grm_install.exe
	RMDir /r $INSTDIR\temp
SectionEnd

Section /o "DXVK" Section3
	SectionInstType ${IT_AMD} 

	CreateDirectory "$INSTDIR\temp"
	SetOutPath $INSTDIR\temp

	DetailPrint "Downloading Vulkan-Test to check for DXVK support..."
	NScurl::http GET "https://github.com/skeeto/vulkan-test/releases/download/1.0.2/vulkan_test.exe" "vulkan_test.exe" /RESUME /INSIST /CANCEL /END
	ExecWait "vulkan_test.exe"

	Delete "$INSTDIR\temp\vulkan_test.exe"
		RMDir /r "$INSTDIR\temp"
		Pop $0
		DetailPrint "Cleanup result: $0"
	MessageBox MB_YESNO "DXVK requires Vulkan support. If the message box said it successfully created a Vulkan instance, click Yes. Otherwise, click NO." IDYES true IDNO false
	true: 
		SetOutPath "$INSTDIR\Fun with Pets\SP9\TSBin\"
		DetailPrint "Downloading DXVK $DXVKVER..."
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/components/d3d9.dll" "$INSTDIR\Fun with Pets\SP9\TSBin\d3d9.dll" /RESUME /INSIST /CANCEL /END
		Pop $0 # return value = exit code, "OK" means OK
		DetailPrint "DXVK download status: $0." 

		NScurl::http GET "https://raw.githubusercontent.com/doitsujin/dxvk/v2.1/dxvk.conf" "$INSTDIR\Fun with Pets\SP9\TSBin\dxvk.conf" /RESUME /INSIST /CANCEL /END
		Pop $0
		DetailPrint "DXVK.conf download status: $0." 
	false:
		DetailPrint "Vulkan is unsupported, DXVK will be skipped."
	next:
	DetailPrint "DXVK section complete."
	RMDir /r "$INSTDIR\temp"
SectionEnd
	
Section "Visual C++ Redist" Section4
	SectionInstType ${IT_FULL} ${IT_AMD}

	CreateDirectory "$INSTDIR\temp"	
	DetailPrint "Downloading VC Redist..."
	NScurl::http GET "https://aka.ms/vs/17/release/vc_redist.x86.exe" "temp\vc_redist.x86.exe" /RESUME /INSIST /CANCEL /END
	Pop $0
	DetailPrint "VC Redist download status: $0. Executing silently..."
	ExecWait "$INSTDIR\temp\vc_redist.x86.exe /q /norestart"
	Delete "$INSTDIR\temp\vc_redist.x86.exe"
	RMDir /r "$INSTDIR\temp"
	Pop $0
	DetailPrint "Cleanup result: $0"	
SectionEnd
	
Section ".NET Framework" Section5
	SectionInstType ${IT_FULL} ${IT_AMD}

	CreateDirectory "$INSTDIR\temp"	
	DetailPrint "Downloading x86 .NET Framework..."
	NScurl::http GET "https://go.microsoft.com/fwlink/?LinkId=2085155" "temp\ndp48_web.exe" /RESUME /INSIST /CANCEL /END
	Pop $0
	DetailPrint ".NET Framework download status: $0. Executing silently..."
	ExecWait "$INSTDIR\temp\ndp48_web.exe /q /norestart"
	Delete "$INSTDIR\temp\ndp48_web.exe"
	RMDir /r "$INSTDIR\temp"
	Pop $0
	DetailPrint "Cleanup result: $0"
SectionEnd
	
Section "Sim Shadow Fix" Section6
	SectionInstType ${IT_FULL}

	SetOutPath "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
	NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v11/components/simNopke-simShadowFix0.3reallyNotMisty.package" "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads\simNopke-simShadowFix0.3reallyNotMisty.package" /RESUME /INSIST /CANCEL /END
	Pop $0
	DetailPrint "Shadow Fix download status: $0"
	ExecShell "open" "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
SectionEnd

Section
	ExecShell "open" "$INSTDIR\Fun with Pets\SP9\TSBin"
SectionEnd

Section "Start Menu/Desktop Shortcut" Section7
	SectionInstType ${IT_FULL} ${IT_AMD}
	SetShellVarContext all
	SetOutPath "$INSTDIR\Fun with Pets\SP9\TSBin"
	CreateDirectory '$SMPROGRAMS\The Sims 2 Starter Pack\'
	CreateShortCut '$SMPROGRAMS\The Sims 2 Starter Pack\Sims2RPC.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' 0
	CreateShortCut '$Desktop\Sims2RPC.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' 0
SectionEnd 

Section "Uninstall" Section8
	SetRegView 32
	Delete "$INSTDIR\Uninstall The Sims 2 Starter Pack.exe"
	ReadRegStr $R4 HKLM32 "SOFTWARE\EA GAMES\The Sims 2" "Folder" 
	${If} $R4 = $INSTDIR
	RMDir /r $R4
    ${EndIf}
	DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2"
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
	DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP1.exe"	
	DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP2.exe"	
	DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP4.exe"	
	DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP5.exe"	
	DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP6.exe"	
	DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP7.exe"
	DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2SP8.exe"	
	RMDir /r "$SMPROGRAMS\The Sims 2 Starter Pack"
	Delete "$Desktop\Sims2RPC.lnk"
SectionEnd

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${Section1} "Installs The Sims 2 Ultimate Collection and Sims2RPC v1.15 (minimal install)."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section2} "Installs Graphics Rules Maker 2.0.0."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section3} "Installs DXVK $DXVKVER. (Check this if you have a modern AMD graphics card to prevent the long loading screen bug. Otherwise, only select if you know you have a specific reason to. Not recommended for beginners.)"
  !insertmacro MUI_DESCRIPTION_TEXT ${Section4} "Installs Visual C++ Redist (x86) if not already installed."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section5} "Installs .NET Framework if not already installed."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section6} "Installs SimNopke's Sim Shadow Fix to your downloads folder. *Don't Use With DXVK*."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section7} "Create a shortuct to launch the game in your Start Menu/Desktop."
!insertmacro MUI_FUNCTION_DESCRIPTION_END
