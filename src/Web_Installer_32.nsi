Unicode True 
Target x86-unicode

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
OutFile "..\bin\Web Installer\TS2StarterPack-WebInstaller.v12.x32.exe"
RequestExecutionLevel admin
InstallDir "$PROGRAMFILES32\The Sims 2 Starter Pack"
SetCompressor /SOLID LZMA
ShowInstDetails show
ManifestDPIAware True
VIProductVersion 12.0.0.0
VIAddVersionKey "CompanyName" "osab"
VIAddVersionKey "FileVersion" "12.0.0"
VIAddVersionKey "ProductName" "The Sims 2 Starter Pack"
VIAddVersionKey "ProductVersion" "12.0"

########################### MUI SETUP
brandingText "osab Web Installer v12"
!define MUI_ABORTWARNING
!define MUI_INSTFILESPAGE_COLORS "FFFFFF 000000"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_RIGHT
!define MUI_HEADERIMAGE_BITMAP "..\assets\header.bmp"
!define MUI_HEADERIMAGE_BITMAP_STRETCH AspectFitHeight
!define MUI_ICON "..\assets\NewInstaller.ico"
!define MUI_PAGE_HEADER_TEXT "TS2: Starter Pack - Web Installer"
!define MUI_PAGE_HEADER_SUBTEXT "TS2 Ultimate Collection repacked by osab!"
!define MUI_WELCOMEPAGE_TITLE "osab's Sims 2 Starter Pack"
!define MUI_WELCOMEPAGE_TEXT "Welcome to the Sims 2 Starter Pack Web Installer (v12). This installer automatically downloads/installs the game files and dependencies. $\n$\nPlease ensure you have downloaded the latest version from the GitHub! $\n$\nHelpful log messages will be shown in the 'More Details' box."
!define MUI_UNCONFIRMPAGE_TEXT_TOP "WARNING: Before uninstalling, make sure the folder you chose contains ONLY the uninstaller and game files. $\n$\nThe game files MUST be in their own separate folder with no other essential data! I am not responsible for any data loss!"
!define MUI_LICENSEPAGE_TEXT_TOP "License Information:"
!define MUI_FINISHPAGE_SHOWREADME "https://docs.google.com/document/d/1UT0HX3cO4xLft2KozGypU_N7ZcGQVr-54QD9asFsx5U/edit#heading=h.6jnaz4t6d3vx"
!define MUI_FINISHPAGE_SHOWREADME_TEXT "Open the next step of the guide (Graphics Setup)?"
!define MUI_FINISHPAGE_NOREBOOTSUPPORT
!define MUI_FINISHPAGE_LINK "TS2 Community Discord Server!"
!define MUI_FINISHPAGE_LINK_LOCATION "https://discord.gg/invite/ts2-community-912700195249197086"
!define MUI_FINISHPAGE_LINK_COLOR "5865F2"
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
InstType "Modern AMD Graphics preset" IT_AMD
InstType "Minimal (Linux/WINE optimized)" IT_MIN
	
SectionGroup /e "TS2 Starter Pack"
Section "TS2 Starter Pack" Section1
	SectionInstType ${IT_FULL} ${IT_AMD} ${IT_MIN}
	SectionIn RO 
	SetOutPath $INSTDIR
	SetOverwrite on
	InitPluginsDir
	AddSize 15000000

	!insertmacro RemovePreviousInstall
		
	StrCpy $AL "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v12/ApartmentLife.v12.7z"
	StrCpy $BoB "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v12/BestofBusiness.v12.7z"
	StrCpy $BV "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v12/BonVoyage.v12.7z"
	StrCpy $Base "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v12/Base.v12.7z"
	StrCpy $DD "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v12/DoubleDeluxe.v12.7z"
	StrCpy $FT "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v12/FreeTime.v12.7z"
	StrCpy $FwP "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v12/FunwithPets.v12.7z"
	StrCpy $GLS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v12/GlamourLifeStuff.v12.7z"
	StrCpy $SS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v12/Seasons.v12.7z"
	StrCpy $UNI "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v12/UniversityLife.v12.7z"
		
	CreateDirectory "$INSTDIR\temp"
	!insertmacro downloadPack "Apartment Life" "$AL" "temp\ApartmentLife.7z" "f443736f43d3678dc54c0bc105a6d8776bfdbfef7d38801409051a9bf37368fb"
	!insertmacro downloadPack "Best of Business" "$BoB" "temp\BestofBusiness.7z" "3deb97133ba4b2f95a4bea3188aae8fb3d6e46dff9625f02342507c0f1dfa86a"
	!insertmacro downloadPack "Bon Voyage" "$BV" "temp\BonVoyage.7z" "485481e4144b49bc6dffefed2b177d4c90cd51023db6e44875a6344e985a41a1"
	!insertmacro downloadPack "Base Game" "$Base" "temp\Base.7z" "ab4d1cee854b5ca5dc7cf6e65746ab30f4d1ee407cd609a5bd86568e330b06c7"
	!insertmacro downloadPack "Double Deluxe Packs" "$DD" "temp\DoubleDeluxe.7z" "3cc771c01a846fbf27b81d5ad5fce117bd998197e19674a1fa0aabc60bd45d91"
	!insertmacro downloadPack "FreeTime" "$FT" "temp\FreeTime.7z" "3d250fe1da11b27df40daa291c80343a24bbdeef9387e016107819767035bf57"
	!insertmacro downloadPack "Fun with Pets" "$FwP" "temp\FunwithPets.7z" "3cf7cd78a5b38b9f152db759281d0a0a541ff2972e3b9997eb1c392deeeb70c3"
	!insertmacro downloadPack "Glamour Life Stuff" "$GLS" "temp\GlamourLifeStuff.7z" "838d8011915942fbc27787c4bc967d3c78f0a61c1605f48efe899613201d6c1d"
	!insertmacro downloadPack "Seasons" "$SS" "temp\Seasons.7z" "5b11abd4dd02b22668f54548a6ba5ca58d526ac7b11cd005e212fe100c7c74fb"
	!insertmacro downloadPack "University Life" "$UNI" "temp\UniversityLife.7z" "c1a11790dc42c513cef00f1760292167b69eb8a73f0423edf210c06e34905c70"

	# Touchup
	DetailPrint "Touching Up..."
	!insertmacro touchup "The Sims 2 Ultimate Collection" "EA GAMES\The Sims 2" "{04450C18-F039-4B81-A621-70C3B0F523D5}" "Sims2EP9.exe"

	# RPC
	!insertmacro downloadPack "Sims2RPC" "https://github.com/voicemxil/TS2-Starter-Pack/raw/v12/components/SFX_Sims2RPC_1.15.exe" "$INSTDIR\temp\SFX_Sims2RPC.exe" "39aa5c91cb584b63fec783db5554c67bf139ca8af13dd297f7cb2bc61056307c"

	Delete "$INSTDIR\temp\SFX_Sims2RPC.exe"

	!insertmacro setLanguage "EA GAMES\The Sims 2" # macro takes in ts2 registry key
	DetailPrint "Adding Language Selection files to game folder..."
	CreateDirectory "$INSTDIR\_Language Selection"
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/Chinese_Simplified.reg" "$INSTDIR\_Language Selection\Chinese_Simplified.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/Chinese_Traditional.reg" "$INSTDIR\_Language Selection\Chinese_Traditional.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/Czech.reg" "$INSTDIR\_Language Selection\Czech.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/Dutch.reg" "$INSTDIR\_Language Selection\Dutch.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/English_UK.reg" "$INSTDIR\_Language Selection\English_UK.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/Finnish.reg" "$INSTDIR\_Language Selection\Finnish.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/French.reg" "$INSTDIR\_Language Selection\French.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/German.reg" "$INSTDIR\_Language Selection\German.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/Greek.reg" "$INSTDIR\_Language Selection\Greek.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/Hebrew.reg" "$INSTDIR\_Language Selection\Hebrew.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/Hungarian.reg" "$INSTDIR\_Language Selection\Hungarian.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/Italian.reg" "$INSTDIR\_Language Selection\Italian.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/Japanese.reg" "$INSTDIR\_Language Selection\Japanese.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/Korean.reg" "$INSTDIR\_Language Selection\Korean.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/Norwegian.reg" "$INSTDIR\_Language Selection\Norwegian.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/Portuguese_Portugal.reg" "$INSTDIR\_Language Selection\Portuguese_Portugal.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/Polish.reg" "$INSTDIR\_Language Selection\Polish.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/Portuguese_Brazil.reg" "$INSTDIR\_Language Selection\Portuguese_Brazil.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/Russian.reg" "$INSTDIR\_Language Selection\Russian.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/Spanish.reg" "$INSTDIR\_Language Selection\Spanish.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/Swedish.reg" "$INSTDIR\_Language Selection\Swedish.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/language-selection/Thai.reg" "$INSTDIR\_Language Selection\Thai.reg" /BACKGROUND /END

	DetailPrint "Creating Downloads folder..."
	CreateDirectory "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads" 
	WriteUninstaller "$INSTDIR\Uninstall The Sims 2 Starter Pack.exe"
SectionEnd

Section /o "Disable Intro Videos?" Section2
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Movies\ealogo_audio.movie.backup"
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Brazilian Portuguese\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Brazilian Portuguese\Movies\ealogo_audio.movie.backup"
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Czech\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Czech\Movies\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Danish\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Danish\Movies\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Dutch\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Dutch\Movies\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Finnish\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Finnish\Movies\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\French\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\French\Movies\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\German\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\German\Movies\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Hungarian\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Hungarian\Movies\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Italian\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Italian\Movies\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Japanese\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Japanese\Movies\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Korean\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Korean\Movies\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Norwegian\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Norwegian\Movies\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Polish\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Polish\Movies\ealogo_audio.movie.backup"		
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Russian\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Russian\Movies\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Simplified Chinese\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Simplified Chinese\Movies\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Spanish\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Spanish\Movies\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Swedish\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Swedish\Movies\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Thai\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Thai\Movies\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Traditional Chinese\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\Traditional Chinese\Movies\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\UK English\Movies\ealogo_audio.movie" "$INSTDIR\Fun with Pets\SP9\TSData\Res\Locale\UK English\Movies\ealogo_audio.movie.backup"	

	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Movies\intro_eng_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Movies\intro_eng_audio.movie.backup"

	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Movies\ealogo_audio.movie.backup"
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Brazilian Portuguese\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Brazilian Portuguese\ealogo_audio.movie.backup"
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Czech\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Czech\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Danish\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Danish\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Dutch\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Dutch\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Finnish\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Finnish\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\French\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\French\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\German\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\German\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Hungarian\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Hungarian\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Italian\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Italian\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Japanese\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Japanese\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Korean\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Korean\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Norwegian\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Norwegian\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Polish\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Polish\ealogo_audio.movie.backup"		
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Russian\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Russian\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Simplified Chinese\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Simplified Chinese\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Spanish\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Spanish\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Swedish\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Swedish\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Thai\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Thaiealogo_audio.movie.backup"	
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Traditional Chinese\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\Traditional Chinese\ealogo_audio.movie.backup"	
	Rename "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\UK English\Movies\ealogo_audio.movie" "$INSTDIR\Double Deluxe\Base\TSData\Res\Locale\UK English\ealogo_audio.movie.backup"	
SectionEnd

SectionGroupEnd
	
Section "Graphics Rules Maker" Section3
	SectionInstType ${IT_FULL} ${IT_AMD} ${IT_MIN}

	SetOutPath "$INSTDIR\temp"
	${If} ${RunningX64}
		DetailPrint "Downloading Graphics Rules Maker..."
		NScurl::http GET "https://www.simsnetwork.com/files/graphicsrulesmaker/graphicsrulesmaker-2.0.0-64bit.exe" "$INSTDIR\temp\grm_install.exe" /RESUME /INSIST /CANCEL /END
		Pop $0 # return value = exit code, "OK" means OK
		DetailPrint "GRM download status: $0. Executing installer..." 
	${Else}
		DetailPrint "Downloading Graphics Rules Maker.."
		NScurl::http GET "https://www.simsnetwork.com/files/graphicsrulesmaker/graphicsrulesmaker-2.0.0-32bit.exe" "$INSTDIR\temp\grm_install.exe" /RESUME /INSIST /CANCEL /END
		Pop $0 # return value = exit code, "OK" means OK
		DetailPrint "GRM download status: $0. Executing installer..." 
	${EndIf}
	Execwait $INSTDIR\temp\grm_install.exe
	Delete $INSTDIR\temp\grm_install.exe
SectionEnd

Section /o "DXVK" Section4
	SectionInstType ${IT_AMD} 

	SetOutPath $INSTDIR\temp

	DetailPrint "Downloading Vulkan-Test to check for DXVK support..."
	NScurl::http GET "https://github.com/skeeto/vulkan-test/releases/download/1.0.2/vulkan_test.exe" "vulkan_test.exe" /RESUME /INSIST /CANCEL /END
	ExecWait "vulkan_test.exe"

	Delete "$INSTDIR\temp\vulkan_test.exe"
		Pop $0
		DetailPrint "Cleanup result: $0"
	MessageBox MB_YESNO "DXVK requires Vulkan support. If the message box said it successfully created a Vulkan instance, click Yes. Otherwise, click NO." IDYES true IDNO false
	true: 
		SetOutPath "$INSTDIR\Fun with Pets\SP9\TSBin\"
		DetailPrint "Downloading DXVK $DXVKVER..."
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v12/components/d3d9.dll" "$INSTDIR\Fun with Pets\SP9\TSBin\d3d9.dll" /RESUME /INSIST /CANCEL /END
		Pop $0 # return value = exit code, "OK" means OK
		DetailPrint "DXVK download status: $0." 

		NScurl::http GET "https://raw.githubusercontent.com/doitsujin/dxvk/v2.1/dxvk.conf" "$INSTDIR\Fun with Pets\SP9\TSBin\dxvk.conf" /RESUME /INSIST /CANCEL /END
		Pop $0
		DetailPrint "DXVK.conf download status: $0." 
		goto next
	false:
		DetailPrint "Vulkan is unsupported, DXVK will be skipped."
	next:
SectionEnd
	
Section "Visual C++ Redist" Section5
	SectionInstType ${IT_FULL} ${IT_AMD}

	SetOutPath "$INSTDIR\temp"	
	DetailPrint "Downloading x86 VC Redist..."
	NScurl::http GET "https://aka.ms/vs/17/release/vc_redist.x86.exe" "temp\vc_redist.x86.exe" /RESUME /INSIST /CANCEL /END
	Pop $0
	DetailPrint "VC Redist download status: $0. Executing silently..."
	ExecWait "$INSTDIR\temp\vc_redist.x86.exe /q /norestart"
	Delete "$INSTDIR\temp\vc_redist.x86.exe"
	Pop $0
	DetailPrint "Cleanup result: $0"	
SectionEnd
	
Section ".NET Framework" Section6
	SectionInstType ${IT_FULL} ${IT_AMD}

	SetOutPath "$INSTDIR\temp"	
	DetailPrint "Downloading x86 .NET Framework..."
	NScurl::http GET "https://go.microsoft.com/fwlink/?LinkId=2085155" "temp\ndp48_web.exe" /RESUME /INSIST /CANCEL /END
	Pop $0
	DetailPrint ".NET Framework download status: $0. Executing silently..."

	ExecWait "$INSTDIR\temp\ndp48_web.exe /q /norestart"

	Delete "$INSTDIR\temp\ndp48_web.exe"
	Pop $0
	DetailPrint "Cleanup result: $0"
SectionEnd
	
Section "Sim Shadow Fix" Section7
	SectionInstType ${IT_FULL}
	DetailPrint "Donwloading Sim Shadow Fix..."
	SetOutPath "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
	NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v12/components/simNopke-simShadowFix0.3reallyNotMisty.package" "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads\simNopke-simShadowFix0.3reallyNotMisty.package" /RESUME /INSIST /CANCEL /END
	Pop $0
	DetailPrint "Shadow Fix download status: $0"
	ExecShell "open" "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
SectionEnd

Section "Start Menu/Desktop Shortcut" Section8
	SectionInstType ${IT_FULL} ${IT_AMD}
	
	SetShellVarContext all
	SetOutPath "$INSTDIR\Fun with Pets\SP9\TSBin"
	CreateDirectory '$SMPROGRAMS\The Sims 2 Starter Pack\'
	CreateShortCut '$SMPROGRAMS\The Sims 2 Starter Pack\Sims2RPC.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' 0
	CreateShortCut '$Desktop\Sims2RPC.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' 0
SectionEnd 

Section
	ExecShell "open" "$INSTDIR\Fun with Pets\SP9\TSBin"
	RMDir /r "$INSTDIR\temp"
SectionEnd

Section "Uninstall" Section9
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
  !insertmacro MUI_DESCRIPTION_TEXT ${Section2} "Disables EA Logo and Intro videos from playing."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section3} "Installs Graphics Rules Maker 2.0.0."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section4} "Installs DXVK $DXVKVER. (Check this if you have a modern AMD graphics card to prevent the long loading screen bug. Otherwise, only select if you know you have a specific reason to. Not recommended for beginners.)"
  !insertmacro MUI_DESCRIPTION_TEXT ${Section5} "Installs Visual C++ Redist (x86) if not already installed."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section6} "Installs .NET Framework if not already installed."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section7} "Installs SimNopke's Sim Shadow Fix to your downloads folder. *Don't Use With DXVK*."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section8} "Create a shortuct to launch the game in your Start Menu/Desktop."
!insertmacro MUI_FUNCTION_DESCRIPTION_END
