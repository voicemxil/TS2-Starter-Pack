Unicode True 
; Target amd64-unicode
Target x86-unicode

# Installer SETUP
!define MUI_WELCOMEFINISHPAGE_BITMAP "..\assets\InstallerImage.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "..\assets\InstallerImage.bmp"
!include "ModernXL.nsh"
!include "MUI2.nsh"
!include "x64.nsh"
!include ".\Downloader.nsh"
!include ".\Language-r.nsh"
!include ".\Touchup-er.nsh"
!include ".\RemovePriorInstallation.nsh"

Name "The Sims 2 Starter Pack"
OutFile "..\bin\Web Installer\TS2StarterPack-WebInstaller.x32.exe"
RequestExecutionLevel admin
InstallDir "$PROGRAMFILES32\The Sims 2 Starter Pack"
SetCompressor /SOLID LZMA
ManifestDPIAware True
VIProductVersion 13.1.0.0
VIAddVersionKey "CompanyName" "osab"
VIAddVersionKey "FileVersion" "13.1.0"
VIAddVersionKey "ProductName" "The Sims 2 Starter Pack"
VIAddVersionKey "ProductVersion" "13.1"

# MUI SETUP
brandingText "osab Web Installer v13.1"
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
!define MUI_WELCOMEPAGE_TEXT "Welcome to the Sims 2 Starter Pack Web Installer (v13). This installer automatically downloads/installs The Sims 2 Ultimate Collection and dependencies/fixes for modern systems. $\n$\nPlease ensure you have downloaded the latest version from the GitHub! $\n$\nHelpful log messages will be shown in the 'More Details' box. $\n$\nThe installer sets the game language automatically, however you can change it if needed via the included registry files in the $\"_Language Selection$\" folder."
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

# Begin Installation
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
InstType "DXVK - Only recommended for modern AMD Graphics (RX 400+) on Windows" IT_AMD
	
Section "TS2 Starter Pack" Section1
	SectionInstType ${IT_FULL} ${IT_AMD}
	SectionIn RO 
	SetOutPath $INSTDIR
	SetOverwrite on
	InitPluginsDir
	AddSize 9600000

	!insertmacro RemovePreviousInstall
		
	StrCpy $AL "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13/ApartmentLife.7z"
	StrCpy $BoB "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13/BestofBusiness.7z"
	StrCpy $BV "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13/BonVoyage.7z"
	StrCpy $Base "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13/Base.7z"
	StrCpy $DD "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13/DoubleDeluxe.7z"
	StrCpy $FT "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13/FreeTime.7z"
	StrCpy $FwP "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13/FunwithPets.7z"
	StrCpy $GLS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13/GlamourLifeStuff.7z"
	StrCpy $SS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13/Seasons.7z"
	StrCpy $UNI "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13/UniversityLife.7z"
		
	# Downloading Game
	CreateDirectory "$INSTDIR\temp"
	!insertmacro downloadPack "Apartment Life" "$AL" "temp\ApartmentLife.7z" "5b28dcb2fa9b7b2fc1793a56e616ade27dd25b93f49cc0ffe221779ce181b0ab"
	!insertmacro downloadPack "Best of Business" "$BoB" "temp\BestofBusiness.7z" "57744297722a08983db83051b2b4d856d67fd3bbad5dc42441830628a726d933"
	!insertmacro downloadPack "Bon Voyage" "$BV" "temp\BonVoyage.7z" "18ed4c238b8c15a6e67378533aca8c78dcfd648ad70518965d5abe5c147e4f81"
	!insertmacro downloadPack "Base Game" "$Base" "temp\Base.7z" "a599b54ae6b6bd26b10bdff507cc7f33cc01e1016afca992b366e72bc3b143e2"
	!insertmacro downloadPack "Double Deluxe Packs" "$DD" "temp\DoubleDeluxe.7z" "3d96826e87f3f0b4c57276a4e4c7519b299fe2ed4dab77b88159e84b447cd60f"
	!insertmacro downloadPack "FreeTime" "$FT" "temp\FreeTime.7z" "0cacadd336f17e8571043fde81613d6ca3c967c8f273a31f55dcf2489c9a3288"
	!insertmacro downloadPack "Fun with Pets" "$FwP" "temp\FunwithPets.7z" "1b0781a4cfd0a56ae8b876d78993008f97068341c854b39a69a146889ef13d54"
	!insertmacro downloadPack "Glamour Life Stuff" "$GLS" "temp\GlamourLifeStuff.7z" "c0b6e9725dcc89e2ac16505bd32d417526d4bc96382015732e39c92030c4a749"
	!insertmacro downloadPack "Seasons" "$SS" "temp\Seasons.7z" "6913ca6f3acf9ae47646d131e3fd97a9901556da6d09ded01d7d2b3a8942c7d5"
	!insertmacro downloadPack "University Life" "$UNI" "temp\UniversityLife.7z" "674dad74c6c8c643c3d14fbe7ad9736dea3ae3fff8b8636ec403eef68539d2e1"

	# Touchup
	DetailPrint "Touching Up..."
	!insertmacro touchup "The Sims 2 Ultimate Collection" "EA GAMES\The Sims 2" "{04450C18-F039-4B81-A621-70C3B0F523D5}" "Sims2EP9.exe"

	# Patches included in game files: Holiday Pack Fix, AL/MG UI Text Fix, Localized Music Unlocked, Sims 2 Cleanup Script

	# Install Sims2RPC
	!insertmacro downloadPack "Sims2RPC" "https://github.com/voicemxil/TS2-Starter-Pack/raw/v13/components/Sims2RPC_1.15.7z" "$INSTDIR\temp\Sims2RPC.7z" "f3091ab315252425c742edb6c6635b3f67105c60cba164d096db11359e4283eb"
	Delete "$INSTDIR\temp\Sims2RPC.7z"
	
	# LdDarcy Pie Menu Text Strings Fix
	NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v13/components/LdDarcy_PieMenuTextStringsFix.package" "$INSTDIR\Fun with Pets\SP9\TSData\Res\UI\LdDarcy_PieMenuTextStringsFix.package" /BACKGROUND /END

	# Downloads Folder
	DetailPrint "Creating Downloads folder..."
	CreateDirectory "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads" 

	# Autodetect Launguage
	!insertmacro setLanguage "EA GAMES\The Sims 2" # macro takes in ts2 registry key
	DetailPrint "Adding Language Selection files to game folder..."

	# Language Selection Files
	CreateDirectory "$INSTDIR\_Language Selection"
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/Chinese_Simplified.reg" "$INSTDIR\_Language Selection\Chinese_Simplified.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/Chinese_Traditional.reg" "$INSTDIR\_Language Selection\Chinese_Traditional.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/Czech.reg" "$INSTDIR\_Language Selection\Czech.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/Dutch.reg" "$INSTDIR\_Language Selection\Dutch.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/English_UK.reg" "$INSTDIR\_Language Selection\English_UK.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/Finnish.reg" "$INSTDIR\_Language Selection\Finnish.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/French.reg" "$INSTDIR\_Language Selection\French.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/German.reg" "$INSTDIR\_Language Selection\German.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/Greek.reg" "$INSTDIR\_Language Selection\Greek.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/Hebrew.reg" "$INSTDIR\_Language Selection\Hebrew.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/Hungarian.reg" "$INSTDIR\_Language Selection\Hungarian.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/Italian.reg" "$INSTDIR\_Language Selection\Italian.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/Japanese.reg" "$INSTDIR\_Language Selection\Japanese.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/Korean.reg" "$INSTDIR\_Language Selection\Korean.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/Norwegian.reg" "$INSTDIR\_Language Selection\Norwegian.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/Portuguese_Portugal.reg" "$INSTDIR\_Language Selection\Portuguese_Portugal.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/Polish.reg" "$INSTDIR\_Language Selection\Polish.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/Portuguese_Brazil.reg" "$INSTDIR\_Language Selection\Portuguese_Brazil.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/Russian.reg" "$INSTDIR\_Language Selection\Russian.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/Spanish.reg" "$INSTDIR\_Language Selection\Spanish.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/Swedish.reg" "$INSTDIR\_Language Selection\Swedish.reg" /BACKGROUND /END
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/Language_Selection/Thai.reg" "$INSTDIR\_Language Selection\Thai.reg" /BACKGROUND /END
	
	# Readonly Objects.package
	SetFileAttributes "$INSTDIR\Apartment Life\TSData\Res\Objects\objects.package" READONLY
	SetFileAttributes "$INSTDIR\Best of Business\EP3\TSData\Res\Objects\objects.package" READONLY	
	SetFileAttributes "$INSTDIR\Best of Business\SP5\TSData\Res\Objects\objects.package" READONLY
	SetFileAttributes "$INSTDIR\Best of Business\SP7\TSData\Res\Objects\objects.package" READONLY
	SetFileAttributes "$INSTDIR\Bon Voyage\TSData\Res\Objects\objects.package" READONLY
	SetFileAttributes "$INSTDIR\Double Deluxe\Base\TSData\Res\Objects\objects.package" READONLY
	SetFileAttributes "$INSTDIR\Double Deluxe\EP2\TSData\Res\Objects\objects.package" READONLY
	SetFileAttributes "$INSTDIR\Double Deluxe\SP4\TSData\Res\Objects\objects.package" READONLY
	SetFileAttributes "$INSTDIR\Free Time\TSData\Res\Objects\objects.package" READONLY
	SetFileAttributes "$INSTDIR\Fun with Pets\EP4\TSData\Res\Objects\objects.package" READONLY
	SetFileAttributes "$INSTDIR\Fun with Pets\SP1\TSData\Res\Objects\objects.package" READONLY
	SetFileAttributes "$INSTDIR\Fun with Pets\SP9\TSData\Res\Objects\objects.package" READONLY
	SetFileAttributes "$INSTDIR\Glamour Life Stuff\TSData\Res\Objects\objects.package" READONLY
	SetFileAttributes "$INSTDIR\Seasons\TSData\Res\Objects\objects.package" READONLY
	SetFileAttributes "$INSTDIR\University Life\EP1\TSData\Res\Objects\objects.package" READONLY	
	SetFileAttributes "$INSTDIR\University Life\SP6\TSData\Res\Objects\objects.package" READONLY
	SetFileAttributes "$INSTDIR\University Life\SP8\TSData\Res\Objects\objects.package" READONLY

	# CEP Color Enable Package
	SetOutPath "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/CEP/_EnableColorOptionsGMND.package" "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads\_EnableColorOptionsGMND.package" /RESUME /END
	Pop $0
	DetailPrint "_EnableColorOptionsGMND.package download status: $0"
	SetOutPath "$INSTDIR\Double Deluxe\Base\TSData\Res\Sims3D"
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/CEP/_EnableColorOptionsMMAT.package" "$INSTDIR\Double Deluxe\Base\TSData\Res\Sims3D\_EnableColorOptionsMMAT.package" /RESUME /END
	Pop $0
	DetailPrint "_EnableColorOptionsMMAT.package download status: $0"
	SetOutPath "$INSTDIR\temp"
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/CEP/zCEP-EXTRA_Documents.7z" "$INSTDIR\temp\zCEP-EXTRA_Documents.7z" /RESUME /END
	Pop $0
	DetailPrint "zCEP-EXTRA_Documents.7z download status: $0"
	SetOutPath "$Documents\EA Games\The Sims 2 Ultimate Collection"
	Nsis7z::ExtractWithDetails "$INSTDIR\temp\zCEP-EXTRA_Documents.7z" "%s"
	Pop $0
	DetailPrint "zCEP-EXTRA_Documents.7z extract status: $0"	
	SetOutPath "$INSTDIR\temp"
	NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/CEP/zCEP-EXTRA_ProgramFiles.7z" "$INSTDIR\temp\zCEP-EXTRA_ProgramFiles.7z" /RESUME /END
	Pop $0
	DetailPrint "zCEP-EXTRA_ProgramFiles.7z download status: $0"	
	SetOutPath "$INSTDIR\Double Deluxe\Base\TSData\Res\Catalog"
	Nsis7z::ExtractWithDetails "$INSTDIR\temp\zCEP-EXTRA_ProgramFiles.7z" "%s"
	Pop $0
	DetailPrint "zCEP-EXTRA_ProgramFiles.7z extract status: $0"	

	Delete "$INSTDIR\temp\zCEP-EXTRA_Documents.7z"
	Delete "$INSTDIR\temp\zCEP-EXTRA_ProgramFiles.7z"

	# Create Uninstaller
	SetOutPath $INSTDIR
	WriteUninstaller "$INSTDIR\Uninstall The Sims 2 Starter Pack.exe"
SectionEnd
	
SectionGroup /e "Graphical Fixes/Tweaks"
	Section "Graphics Rules Maker" Section3
		SectionInstType ${IT_FULL} ${IT_AMD}

		SetOutPath "$INSTDIR\temp"
		${If} ${RunningX64}
			DetailPrint "Downloading Graphics Rules Maker..."
			NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/GraphicsRulesMaker-2.3.0-win64.exe" "$INSTDIR\temp\grm_install.exe" /RESUME /INSIST /CANCEL /END
			Pop $0 # return value = exit code, "OK" means OK
			DetailPrint "GRM download status: $0. Executing installer..." 
		${Else}
			DetailPrint "Downloading Graphics Rules Maker.."
			NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/GraphicsRulesMaker-2.3.0-win32.exe" "$INSTDIR\temp\grm_install.exe" /RESUME /INSIST /CANCEL /END
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
		NScurl::http GET "https://github.com/skeeto/vulkan-test/releases/download/1.0.2/vulkan_test.exe" "$INSTDIR\temp\vulkan_test.exe" /RESUME /INSIST /END
		ExecWait "vulkan_test.exe"

		Delete "$INSTDIR\temp\vulkan_test.exe"
			Pop $0
			DetailPrint "Cleanup result: $0"
		MessageBox MB_YESNO "DXVK requires Vulkan support. If the message box said it successfully created a Vulkan instance, click Yes. Otherwise, click NO." IDYES true IDNO false
		true: 
			SetOutPath "$INSTDIR\Fun with Pets\SP9\TSBin\"
			DetailPrint "Downloading DXVK $DXVKVER..."
			NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v13/components/d3d9.dll" "$INSTDIR\Fun with Pets\SP9\TSBin\d3d9.dll" /RESUME /INSIST /END
			Pop $0 # return value = exit code, "OK" means OK
			DetailPrint "DXVK download status: $0." 

			NScurl::http GET "https://raw.githubusercontent.com/doitsujin/dxvk/v2.1/dxvk.conf" "$INSTDIR\Fun with Pets\SP9\TSBin\dxvk.conf" /RESUME /INSIST /END
			Pop $0
			DetailPrint "DXVK.conf download status: $0." 
			goto next
		false:
			DetailPrint "Vulkan is unsupported, DXVK will be skipped."
		next:
	SectionEnd

	Section "Sim Shadow Fix" Section5
		SectionInstType ${IT_FULL}
		DetailPrint "Donwloading Sim Shadow Fix..."
		SetOutPath "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v13/components/simNopke-simShadowFix0.3reallyNotMisty.package" "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads\simNopke-simShadowFix0.3reallyNotMisty.package" /RESUME /INSIST /END
		Pop $0
		DetailPrint "Shadow Fix download status: $0"
		ExecShell "open" "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
	SectionEnd
		
	Section "LD Bright CAS Fix" Section6	
		SectionInstType ${IT_FULL} ${IT_AMD}
		DetailPrint "Donwloading Bright CAS Fix..."
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v13/components/ld_BrightCASFix.package" "$INSTDIR\Fun with Pets\SP9\TSData\Res\ld_BrightCASFix.package" /BACKGROUND /END
	SectionEnd
SectionGroupEnd

SectionGroup "Dependencies"
	Section "Visual C++ Redist (x86)" Section7
		SectionInstType ${IT_FULL} ${IT_AMD}

		SetOutPath "$INSTDIR\temp"	
		DetailPrint "Downloading x86 VC Redist..."
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v13/components/VC_redist.x86.exe" "$INSTDIR\temp\vc_redist.x86.exe" /RESUME /INSIST /CANCEL /END
		Pop $0
		DetailPrint "VC Redist download status: $0. Executing silently..."
		ExecWait "$INSTDIR\temp\vc_redist.x86.exe /q /norestart"
		Delete "$INSTDIR\temp\vc_redist.x86.exe"
		Pop $0
		DetailPrint "Cleanup result: $0"	
	SectionEnd
		
	Section ".NET Framework" Section8
		SectionInstType ${IT_FULL} ${IT_AMD}

		SetOutPath "$INSTDIR\temp"	
		DetailPrint "Downloading x86 .NET Framework..."
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v13/components/ndp48-web.exe" "$INSTDIR\temp\ndp48_web.exe" /RESUME /INSIST /CANCEL /END
		Pop $0
		DetailPrint ".NET Framework download status: $0. Executing silently..."

		ExecWait "$INSTDIR\temp\ndp48_web.exe /q /norestart"

		Delete "$INSTDIR\temp\ndp48_web.exe"
		Pop $0
		DetailPrint "Cleanup result: $0"
	SectionEnd
SectionGroupEnd

Section "Store & Preorder/Bonus Content" Section9
	AddSize 360000
	SetOutPath "$INSTDIR\temp"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v13/components/Store_Content/Install_Folder.7z" "$INSTDIR\temp\Install_Folder.7z" /RESUME /END
		Pop $0
		DetailPrint "Install_Folder.7z download result: $0"		
	SetOutPath "$INSTDIR"
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\Install_Folder.7z" "%s"
		Pop $0
		DetailPrint "Install_Folder.7z extract result: $0"		
	SetOutPath "$INSTDIR\temp"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v13/components/Store_Content/Downloads.7z" "$INSTDIR\temp\Downloads.7z" /RESUME /END
		Pop $0
		DetailPrint "Downloads.7z download result: $0"	
	SetOutPath "$Documents\EA Games\The Sims 2 Ultimate Collection"
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\Downloads.7z" "%s"
		Pop $0
		DetailPrint "Downloads.7z extract result: $0"		
	SetOutPath "$INSTDIR\temp"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v13.1/components/Store_Content/Collections.7z.001" "$INSTDIR\temp\Collections.7z.001" /RESUME /END
		Pop $0
		DetailPrint "Collections.7z.001 download result: $0"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v13.1/components/Store_Content/Collections.7z.002" "$INSTDIR\temp\Collections.7z.002" /RESUME /END
		Pop $0
		DetailPrint "Collections.7z.002 download result: $0"
	SetOutPath "$Documents\EA Games\The Sims 2 Ultimate Collection"
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\Collections.7z.001" "%s"
		Pop $0
		DetailPrint "Collections.7z extract result: $0"		
	Delete "$INSTDIR\temp\Install_Folder.7z"
			Pop $0
		DetailPrint "Install_Folder.7z cleanup result: $0"
	Delete "$INSTDIR\temp\Downloads.7z"
			Pop $0
		DetailPrint "Downloads.7z cleanup result: $0"
	Delete "$INSTDIR\temp\Collections.7z"
			Pop $0
		DetailPrint "Collections.7z cleanup result: $0"
SectionEnd

SectionGroup "Extra: Clean Hood Templates"
	Section /o "Main Hood Templates" Section10
		RMDir /r "$INSTDIR\Double Deluxe\Base\TSData\Res\UserData\Neighborhoods\N001"
		RMDir /r "$INSTDIR\Double Deluxe\Base\TSData\Res\UserData\Neighborhoods\N002"
		RMDir /r "$INSTDIR\Double Deluxe\Base\TSData\Res\UserData\Neighborhoods\N003"
		RMDir /r "$INSTDIR\Apartment Life\TSData\Res\UserData\Neighborhoods\E001"
		RMDir /r "$INSTDIR\Free Time\TSData\Res\UserData\Neighborhoods\F001"
		RMDir /r "$INSTDIR\Seasons\TSData\Res\UserData\Neighborhoods\G001"
		SetOutPath "$INSTDIR\temp"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v13/components/Clean_Templates/BG_Hoods.7z" "$INSTDIR\temp\BG_Hoods.7z" /RESUME /END
		SetOutPath "$INSTDIR"
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\BG_Hoods.7z" "%s"
		Delete "$INSTDIR\temp\BG_Hoods.7z"
		Pop $0
		DetailPrint "BG_Hoods.7z cleanup result: $0"
		SetOutPath "$INSTDIR\temp"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v13/components/Clean_Templates/FT_SSNS_Hoods.7z" "$INSTDIR\temp\FT_SSNS_Hoods.7z" /RESUME /END
		SetOutPath "$INSTDIR"
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\FT_SSNS_Hoods.7z" "%s"
		Delete "$INSTDIR\temp\FT_SSNS_Hoods.7z"
		Pop $0
		DetailPrint "FT_SSNS_Hoods.7z cleanup result: $0"
		SetOutPath "$INSTDIR\temp"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v13/components/Clean_Templates/BelladonnaCove.7z" "$INSTDIR\temp\BelladonnaCove.7z" /RESUME /END
		SetOutPath "$INSTDIR"	
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\BelladonnaCove.7z" "%s"
		Delete "$INSTDIR\temp\BelladonnaCove.7z"
		Pop $0
		DetailPrint "BelladonnaCove.7z cleanup result: $0"
	SectionEnd
	Section /o "Subhood Templates" Section11
		RMDir /r "$INSTDIR\Best of Business\EP3\TSData\Res\NeighborhoodTemplate\B001"
		RMDir /r "$INSTDIR\Double Deluxe\EP2\TSData\Res\NeighborhoodTemplate\D001"
		RMDir /r "$INSTDIR\University Life\EP1\TSData\Res\NeighborhoodTemplate\U001"
		RMDir /r "$INSTDIR\University Life\EP1\TSData\Res\NeighborhoodTemplate\U002"
		RMDir /r "$INSTDIR\University Life\EP1\TSData\Res\NeighborhoodTemplate\U003"
		SetOutPath "$INSTDIR\temp"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v13.1/components/Clean_Templates/Subhoods.7z" "$INSTDIR\temp\Subhoods.7z" /RESUME /END
		SetOutPath $INSTDIR 	
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\Subhoods.7z" "%s"
		Delete "$INSTDIR\temp\Subhoods.7z" 
		Pop $0
		DetailPrint "Subhoods.7z cleanup result: $0"
	SectionEnd
	Section /o "Stealth Hood Templates" Section12
		RMDir /r "$INSTDIR\Apartment Life\TSData\Res\NeighborhoodTemplate\E002"
		RMDir /r "$INSTDIR\Bon Voyage\TSData\Res\NeighborhoodTemplate\V001"
		RMDir /r "$INSTDIR\Free Time\TSData\Res\NeighborhoodTemplate\F002"
		RMDir /r "$INSTDIR\Fun with Pets\EP4\TSData\Res\NeighborhoodTemplate\P001"
		RMDir /r "$INSTDIR\Seasons\TSData\Res\NeighborhoodTemplate\G002"
		SetOutPath "$INSTDIR\temp"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v13/components/Clean_Templates/Stealth_Hoods.7z" "$INSTDIR\temp\Stealth_Hoods.7z" /RESUME /END
		SetOutPath $INSTDIR 			
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\Stealth_Hoods.7z" "%s"
		Delete "$INSTDIR\temp\Stealth_Hoods.7z"
		Pop $0
		DetailPrint "Stealth_Hoods.7z cleanup result: $0"
	SectionEnd
SectionGroupEnd

Section "Start Menu/Desktop Shortcut" Section15
	SectionInstType ${IT_FULL} ${IT_AMD}
	
	SetShellVarContext all
	SetOutPath "$INSTDIR\Fun with Pets\SP9\TSBin"
	CreateDirectory '$SMPROGRAMS\The Sims 2 Starter Pack\'
	CreateShortCut '$SMPROGRAMS\The Sims 2 Starter Pack\The Sims 2.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' 0
	CreateShortCut '$Desktop\The Sims 2.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' 0
	CreateShortCut '$Desktop\Sims2RPC Settings.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPCSettings.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPCSettings.exe' 0
SectionEnd 

Section
	RMDir /r "$INSTDIR\temp"
	ExecShell "open" "$INSTDIR\Fun with Pets\SP9\TSBin"
SectionEnd

Section "Uninstall" Section20
	SetRegView 32
	Delete "$INSTDIR\Uninstall The Sims 2 Starter Pack.exe"
	ReadRegStr $R4 HKLM32 "SOFTWARE\EA GAMES\The Sims 2" "Folder" 
	${If} $R4 = $INSTDIR
	RMDir /r "$R4\Apartment Life"
	RMDir /r "$R4\Best of Business"
	RMDir /r "$R4\Bon Voyage"
	RMDir /r "$R4\Double Deluxe"
	RMDir /r "$R4\Free Time"
	RMDir /r "$R4\Fun with Pets"
	RMDir /r "$R4\Glamour Life Stuff"
	RMDir /r "$R4\Seasons"
	RMDir /r "$R4\University Life"
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
  !insertmacro MUI_DESCRIPTION_TEXT ${Section1} "Installs The Sims 2 Ultimate Collection w/ fixes and Sims2RPC v1.15."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section3} "Installs Graphics Rules Maker 2.3.0."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section4} "Installs DXVK $DXVKVER. It's useful on modern AMD graphics cards (RX 400+) to prevent a long loading screen bug. Otherwise, only select if you know you have capable hardware and a specific reason to use it. (When using this option, you do not need the Sim Shadow Fix. If it causes graphical issues, remove d3d9.dll from $\"Fun with Pets\SP9\TSBin.$\")"
  !insertmacro MUI_DESCRIPTION_TEXT ${Section5} "Installs SimNopke's Sim Shadow Fix to your Downloads folder for Windows 8 or higher. (Not needed if installing DXVK)"
  !insertmacro MUI_DESCRIPTION_TEXT ${Section6} "Installs Lazy Duchess's Bright CAS Fix to your install folder."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section7} "Installs Visual C++ Redist (x86) if not already installed. (Required by the game)"
  !insertmacro MUI_DESCRIPTION_TEXT ${Section8} "Installs .NET Framework if not already installed. (Required for Sims2RPC)"
  !insertmacro MUI_DESCRIPTION_TEXT ${Section9} "Installs the Sims 2 Store and pre-order/bonus content."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section10} "Installs cleaned versions of the main neighborhoods. Pleasantview, Veronaville, Riverblossom Hills, Desiderata Valley, & Belladonna Cove by zachjohnunlimited on MTS, Strangetown by Dorsal Axe on MTS."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section11} "Installs cleaned Subhoods - this includes Downtown by @meetmetotheriver and Shopping Districts/Universities by zachjohnunlimited on MTS."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section12} "Installs cleaned Stealth Hoods by @meetmetotheriver."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section15} "Create a shortuct to launch the game in your Start Menu/Desktop."
!insertmacro MUI_FUNCTION_DESCRIPTION_END
