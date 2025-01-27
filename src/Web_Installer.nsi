Unicode true 
;Target amd64-unicode
Target x86-unicode

# includes ----------------------------------------------------------------
!define MUI_WELCOMEFINISHPAGE_BITMAP "..\assets\InstallerImage.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "..\assets\InstallerImage.bmp"
!include "ModernXL.nsh"
!include "MUI2.nsh"
!include "x64.nsh"
!include "WinVer.nsh"
!include "LogicLib.nsh"
!include ".\Downloader.nsh"
!include ".\Language.nsh"
!include ".\Touchup.nsh"
!include ".\RemovePriorInstallation.nsh"

; Links to Packs
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

# installer setup ----------------------------------------------------------------
Name "The Sims 2 Starter Pack"
OutFile "..\bin\Web Installer\TS2StarterPack-WebInstaller.x64.exe"
RequestExecutionLevel admin
InstallDir "$PROGRAMFILES32\The Sims 2 Starter Pack"
SetCompressor /SOLID LZMA
ManifestDPIAware True
VIProductVersion 15.1.0.0
VIAddVersionKey "CompanyName" "osab"
VIAddVersionKey "FileVersion" "15.1.0"
VIAddVersionKey "ProductName" "The Sims 2 Starter Pack"
VIAddVersionKey "ProductVersion" "15.1.0"

# MUI setup ----------------------------------------------------------------
brandingText "osab Web Installer v15.1"
!define MUI_ABORTWARNING
!define MUI_INSTFILESPAGE_COLORS "FFFFFF 000000"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_RIGHT
!define MUI_HEADERIMAGE_BITMAP "..\assets\header.bmp"
!define MUI_HEADERIMAGE_BITMAP_STRETCH AspectFitHeight
!define MUI_ICON "..\assets\NewInstaller.ico"
!define MUI_PAGE_HEADER_TEXT "TS2 Starter Pack: Web Installer"
!define MUI_PAGE_HEADER_SUBTEXT "TS2 Origin Ultimate Collection repacked by osab!"
!define MUI_WELCOMEPAGE_TITLE "The Sims 2 Starter Pack: Web Installer"
!define MUI_WELCOMEPAGE_TEXT "Welcome to The Sims 2 Starter Pack Web Installer. This installer automatically downloads/installs The Sims 2 Ultimate Collection and dependencies/fixes for modern systems. $\n$\nPlease ensure you are using the latest version directly from the GitHub! $\n$\nThis installer guesses the game language based on your system locale, however you can change it if needed by applying the registry files in the included $\"_Language Selection$\" folder."
!define MUI_UNCONFIRMPAGE_TEXT_TOP "WARNING: Before uninstalling, make sure the folder you chose contains ONLY the uninstaller and game files. $\n$\nThe game files MUST be in their own separate folder with no other essential data! I am not responsible for any data loss!"
!define MUI_FINISHPAGE_SHOWREADME "https://ts2.crd.co"
!define MUI_FINISHPAGE_SHOWREADME_TEXT "Open the guide for post-install instructions/tips?"
!define MUI_FINISHPAGE_NOREBOOTSUPPORT
!define MUI_FINISHPAGE_TEXT "The installation has completed. To run the game, launch Sims2RPC or use the desktop/Start menu shortcut."
!define MUI_FINISHPAGE_LINK "TS2 Community Discord Server!"
!define MUI_FINISHPAGE_LINK_LOCATION "https://discord.gg/ts2community"
!define MUI_FINISHPAGE_RUN "$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPCSettings.exe"
!define MUI_FINISHPAGE_RUN_TEXT "Configure Sims2RPC Settings?"
!define MUI_FINISHPAGE_LINK_COLOR "5865F2"
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_DIRECTORY
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH
!insertmacro MUI_LANGUAGE "English"

# Begin Installation ----------------------------------------------------------------

# Current DXVK Version
Var DXVKVER

Function .OnInit
	Dialer::AttemptConnect
	StrCpy $DXVKVER "2.5.3"
FunctionEnd

InstType "Full" IT_FULL

SectionGroup "TS2 Starter Pack"
	Section /o "Cleanup Script Game Files" Section1
	SectionEnd
	Section "TS2 Starter Pack" Section2
		SectionInstType ${IT_FULL}
		SetOutPath $INSTDIR
		SetOverwrite on
		SectionIn RO
		InitPluginsDir
		AddSize 12700000

		!insertmacro RemovePreviousInstall

		${If} ${SectionIsSelected} ${Section1}	
		StrCpy $AL "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/ApartmentLife.7z"
		StrCpy $BoB "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/BestofBusiness.7z"
		StrCpy $BV "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/BonVoyage.7z"
		StrCpy $Base "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/Base.7z"
		StrCpy $DD "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/DoubleDeluxe.7z"
		StrCpy $FT "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/FreeTime.7z"
		StrCpy $FwP "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/FunwithPets.7z"
		StrCpy $GLS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/GlamourLifeStuff.7z"
		StrCpy $SS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/Seasons.7z"
		StrCpy $UNI "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/UniversityLife.7z"

		# Downloading Game
		CreateDirectory "$INSTDIR\temp"
		!insertmacro downloadPack "Apartment Life" "$AL" "temp\ApartmentLife.7z" "f02b62646e28448eb39e291bca46f9aa35202f92bcb047b6cfa8534299eeec0e"
		!insertmacro downloadPack "Best of Business" "$BoB" "temp\BestofBusiness.7z" "d40c4b64b2389443ffb6007119d8fcb3f9158fc7794ba9cc94f08581e521c67e"
		!insertmacro downloadPack "Bon Voyage" "$BV" "temp\BonVoyage.7z" "56bfa2c105a431a871aa4cda42e0925ccf7d8bb989e4ed2cb974183bcf4453de"
		!insertmacro downloadPack "Base Game" "$Base" "temp\Base.7z" "6f3ae7156dec22301b52b14ebaa5f9e5e3ba87ddcfa0335988d0958416514b62"
		!insertmacro downloadPack "Double Deluxe Packs" "$DD" "temp\DoubleDeluxe.7z" "10cecf8869702987ccb536dfa3c78fd59d9d11666d43e78d029f27535a58f5b2"
		!insertmacro downloadPack "FreeTime" "$FT" "temp\FreeTime.7z" "2f92f91f5c97656c8c5dabb46d33dbf0101055ac0b2b7b5c1154b5cd7128459e"
		!insertmacro downloadPack "Fun with Pets" "$FwP" "temp\FunwithPets.7z" "1aa6f71720e12bafbea7bc789cea60f1d95ea67eff4c4b8c05fee57a3ba45595"
		!insertmacro downloadPack "Glamour Life Stuff" "$GLS" "temp\GlamourLifeStuff.7z" "e9642ac8ef1400683f7c54bdb04c10407a3d21a87228a25363dab76bd1144364"
		!insertmacro downloadPack "Seasons" "$SS" "temp\Seasons.7z" "a95957f69b2d89dd681b7e49f3b05f3155a4071e9ed4ec3690486cc89d469866"
		!insertmacro downloadPack "University Life" "$UNI" "temp\UniversityLife.7z" "3a6926bb2005696008f4f8703fee6d3a99099d4eff40dc26a51a21dd4fb86351"
		# Patches included in game files: Holiday Pack Fix, AL/MG UI Text Fix, Localized Music Unlocked, Sims 2 Cleanup Script

		${Else}
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

		# Downloading Game
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
		
		# Patches included in game files: Holiday Pack Fix
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15/components/Patch_LocalizedMusic/Patch_LocalizedMusic.7z.001" "$INSTDIR\temp\Patch_LocalizedMusic.7z.001" /END
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15/components/Patch_LocalizedMusic/Patch_LocalizedMusic.7z.002" "$INSTDIR\temp\Patch_LocalizedMusic.7z.001" /END		
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\Patch_LocalizedMusic.7z.001" "Extracting Localized Music %s"
		Delete "$INSTDIR\temp\Patch_LocalizedMusic.7z.001"
		Delete "$INSTDIR\temp\Patch_LocalizedMusic.7z.002"

		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15/components/Patch_UITextFix/Patch_UITextFix.7z" "$INSTDIR\temp\Patch_UITextFix.7z" /END\
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\Patch_UITextFix.7z" "Extracting AL/MG UI Fixes %s"
		Delete "$INSTDIR\temp\Patch_UITextFix.7z"
		${EndIf}
		
		# Touchup
		DetailPrint "Touching Up..."
		!insertmacro touchup "The Sims 2 Ultimate Collection" "EA GAMES\The Sims 2" "{04450C18-F039-4B81-A621-70C3B0F523D5}" "Sims2EP9.exe"

		# EP9RPC
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15.1/components/Sims2EP9.exe" "$INSTDIR\Fun with Pets\SP9\TSBin\Sims2EP9RPC.exe"/END

		# Install Sims2RPC
		!insertmacro downloadPack "Sims2RPC" "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15.1/components/Sims2RPC_1.15.1.7z" "$INSTDIR\temp\Sims2RPC.7z" "1d54ae7ecd63a165e36b982aa59bb472b84f852ca401e1ec6d728f0fe69db28a"
		SetOutPath $Documents
		CreateDirectory "$Documents\Sims2RPC"
		SetOutPath "$Documents\Sims2RPC"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15.1/components/settings.txt" "$Documents\Sims2RPC\settings.txt"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15.1/components/version.txt" "$Documents\Sims2RPC\version.txt"
		Delete "$INSTDIR\temp\Sims2RPC.7z"
		
		# Unlocked Pet Breeds
		SetOutPath "$INSTDIR\temp"
		Delete "$INSTDIR\Fun with Pets\EP4\TSData\Res\UserData\LockedBins\kissingpoints.package"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15/components/Patch_PetBreeds/Install_Folder.7z" "$INSTDIR\temp\Install_Folder.7z" /BACKGROUND /END
		SetOutPath "$INSTDIR"
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\Install_Folder.7z" "Extracting Unlocked Pet Breeds %s"
		Delete "$INSTDIR\temp\Install_Folder.7z"

		# LdDarcy Pie Menu Text Strings Fix
		SetOutPath "$INSTDIR\Fun with Pets\SP9\TSData\Res\UI"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15/components/LdDarcy_PieMenuTextStringsFix.package" "$INSTDIR\Fun with Pets\SP9\TSData\Res\UI\LdDarcy_PieMenuTextStringsFix.package" /BACKGROUND /END

		# Downloads Folder
		DetailPrint "Creating Downloads folder..."
		CreateDirectory "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads" 

		# Autodetect Launguage
		!insertmacro setLanguage "EA GAMES\The Sims 2" # macro takes in ts2 registry key
		DetailPrint "Adding Language Selection files to game folder..."

		# Language Selection Files
		CreateDirectory "$INSTDIR\_Language Selection"
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/Chinese_Simplified.reg" "$INSTDIR\_Language Selection\Chinese_Simplified.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/Chinese_Traditional.reg" "$INSTDIR\_Language Selection\Chinese_Traditional.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/Czech.reg" "$INSTDIR\_Language Selection\Czech.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/Dutch.reg" "$INSTDIR\_Language Selection\Dutch.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/English_UK.reg" "$INSTDIR\_Language Selection\English_UK.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/Finnish.reg" "$INSTDIR\_Language Selection\Finnish.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/French.reg" "$INSTDIR\_Language Selection\French.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/German.reg" "$INSTDIR\_Language Selection\German.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/Greek.reg" "$INSTDIR\_Language Selection\Greek.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/Hebrew.reg" "$INSTDIR\_Language Selection\Hebrew.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/Hungarian.reg" "$INSTDIR\_Language Selection\Hungarian.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/Italian.reg" "$INSTDIR\_Language Selection\Italian.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/Japanese.reg" "$INSTDIR\_Language Selection\Japanese.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/Korean.reg" "$INSTDIR\_Language Selection\Korean.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/Norwegian.reg" "$INSTDIR\_Language Selection\Norwegian.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/Portuguese_Portugal.reg" "$INSTDIR\_Language Selection\Portuguese_Portugal.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/Polish.reg" "$INSTDIR\_Language Selection\Polish.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/Portuguese_Brazil.reg" "$INSTDIR\_Language Selection\Portuguese_Brazil.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/Russian.reg" "$INSTDIR\_Language Selection\Russian.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/Spanish.reg" "$INSTDIR\_Language Selection\Spanish.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/Swedish.reg" "$INSTDIR\_Language Selection\Swedish.reg" /BACKGROUND /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/Language_Selection/Thai.reg" "$INSTDIR\_Language Selection\Thai.reg" /BACKGROUND /END
		
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
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/CEP/_EnableColorOptionsGMND.package" "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads\_EnableColorOptionsGMND.package" /RESUME /END
		Pop $0
		DetailPrint "_EnableColorOptionsGMND.package download status: $0"
		SetOutPath "$INSTDIR\Double Deluxe\Base\TSData\Res\Sims3D"
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/CEP/_EnableColorOptionsMMAT.package" "$INSTDIR\Double Deluxe\Base\TSData\Res\Sims3D\_EnableColorOptionsMMAT.package" /RESUME /END
		Pop $0
		DetailPrint "_EnableColorOptionsMMAT.package download status: $0"
		SetOutPath "$INSTDIR\temp"
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/CEP/zCEP-EXTRA_Documents.7z" "$INSTDIR\temp\zCEP-EXTRA_Documents.7z" /RESUME /END
		Pop $0
		DetailPrint "zCEP-EXTRA_Documents.7z download status: $0"
		SetOutPath "$Documents\EA Games\The Sims 2 Ultimate Collection"
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\zCEP-EXTRA_Documents.7z" "Extracting CEP-EXTRA_Documents %s"
		Pop $0
		DetailPrint "zCEP-EXTRA_Documents.7z extract status: $0"	
		SetOutPath "$INSTDIR\temp"
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/CEP/zCEP-EXTRA_ProgramFiles.7z" "$INSTDIR\temp\zCEP-EXTRA_ProgramFiles.7z" /RESUME /END
		Pop $0
		DetailPrint "zCEP-EXTRA_ProgramFiles.7z download status: $0"	
		SetOutPath "$INSTDIR\Double Deluxe\Base\TSData\Res\Catalog"
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\zCEP-EXTRA_ProgramFiles.7z" "Extracting CEP-EXTRA_ProgramFiles %s"
		Pop $0
		DetailPrint "zCEP-EXTRA_ProgramFiles.7z extract status: $0"	

		Delete "$INSTDIR\temp\zCEP-EXTRA_Documents.7z"
		Delete "$INSTDIR\temp\zCEP-EXTRA_ProgramFiles.7z"

		# Create Uninstaller
		SetOutPath $INSTDIR
		WriteUninstaller "$INSTDIR\Uninstall The Sims 2 Starter Pack.exe"
	SectionEnd
SectionGroupEnd
	
SectionGroup /e "Graphical Fixes/Tweaks"
	Section "Sim Shadow Fix" Section3
		SectionInstType ${IT_FULL}
		${If} ${IsWin7}
		${OrIf} ${IsWinVista}
		${OrIf} ${IsWinXP}
			DetailPrint "Shadow Fix skipped due to being unnecessary for this Windows version."
		${Else}
		DetailPrint "Donwloading Sim Shadow Fix..."
		SetOutPath "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15/components/simNopke-simShadowFix0.3reallyNotMisty.package" "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads\simNopke-simShadowFix0.3reallyNotMisty.package" /RESUME /INSIST /END
		Pop $0
		DetailPrint "Shadow Fix download status: $0"
		ExecShell "open" "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
		${EndIf}
	SectionEnd

	Section "Graphics Rules Maker" Section4
		SectionInstType ${IT_FULL}
		SetOutPath "$INSTDIR"
		${If} ${IsWin8.1}
		${OrIf} ${IsWin8}
		${OrIf} ${IsWin7}
		${OrIf} ${IsWinVista}
		${OrIf} ${IsWinXP}
			${If} ${RunningX64}
				!insertmacro downloadPack "Graphics Rules Maker (Legacy x64)" "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15.1/components/GRM/GRM-legacy-win64.7z" "$INSTDIR\temp\GraphicsRulesMaker.7z" "e0ae78a5d9c1d747160eb6546486f203d3d86435ad4352ce81f9483e2dc86180"
			${Else}
				!insertmacro downloadPack "Graphics Rules Maker (Legacy x32)" "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15.1/components/GRM/GRM-legacy-win32.7z" "$INSTDIR\temp\GraphicsRulesMaker.7z" "70e065e042d12c2de8303f7b86661443704d464dbc4adb07c7bd84372a246d1f"
			${EndIf}
		${Else}
			${If} ${RunningX64}
				!insertmacro downloadPack "Graphics Rules Maker (x64)" "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15.1/components/GRM/GRM-win64.7z" "$INSTDIR\temp\GraphicsRulesMaker.7z" "ff82645e099ce9d4f3f045ba6431f357bb9fd5011737b96aa84a6205bc18333e"
			${Else}
				!insertmacro downloadPack "Graphics Rules Maker (Legacy x32)" "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15.1/components/GRM/GRM-legacy-win32.7z" "$INSTDIR\temp\GraphicsRulesMaker.7z" "70e065e042d12c2de8303f7b86661443704d464dbc4adb07c7bd84372a246d1f"
			${EndIf}
		${EndIf}
		MessageBox MB_OK "Graphics Rules Maker will now open. Select $\"The Sims 2$\" from the $\"Game$\" dropdown and choose the $\"Auto-detect$\" option, then $\"Save Files.$\" Repeat the process for $\"The Sims 2 Body Shop$\" and then exit the program to continue."
		SetOutPath "$INSTDIR\Graphics Rules Maker\bin"
		Execwait "$INSTDIR\Graphics Rules Maker\bin\GraphicsRulesMakerUi.exe"
	SectionEnd
	
		
	Section "LD Bright CAS Fix" Section5
		SectionInstType ${IT_FULL}
		DetailPrint "Donwloading Bright CAS Fix..."
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15/components/ld_BrightCASFix.package" "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads\ld_BrightCASFix.package" /BACKGROUND /END
	SectionEnd

	Section /o "DXVK (AMD GPU 2016+ - Performance)" Section6
		SetOutPath $INSTDIR\temp

		DetailPrint "Downloading Vulkan-Test to check for DXVK support..."
		NScurl::http GET "https://github.com/skeeto/vulkan-test/releases/download/1.0.2/vulkan_test.exe" "$INSTDIR\temp\vulkan_test.exe" /RESUME /INSIST /END
		ExecWait "vulkan_test.exe"

		Delete "$INSTDIR\temp\vulkan_test.exe"
			Pop $0
			DetailPrint "Cleanup result: $0"
		MessageBox MB_YESNO "You chose to enable DXVK, which requires Vulkan support. If the message box said it successfully created a Vulkan instance, click Yes. Otherwise, click NO." IDYES true IDNO false
		true: 
			SetOutPath "$INSTDIR\Fun with Pets\SP9\TSBin\"
			DetailPrint "Downloading DXVK $DXVKVER..."
			NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15.1/components/DXVK/d3d9.dll" "$INSTDIR\Fun with Pets\SP9\TSBin\d3d9.dll" /RESUME /INSIST /END
			Pop $0 # return value = exit code, "OK" means OK
			DetailPrint "DXVK download status: $0." 
			goto next
		false:
			DetailPrint "Vulkan is unsupported, DXVK will be skipped."
		next:
	SectionEnd

	Section /o "ForceD3d9on12 (Intel ARC/UHD/Iris Graphics - Shadow Crash Fix)" Section13
		SetOutPath "$INSTDIR\Fun with Pets\SP9\TSBin\"
		DetailPrint "Downloading DXWrapper... (Overrides DXVK)"
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15.1/components/DXWrapper/dxwrapper.ini" "$INSTDIR\Fun with Pets\SP9\TSBin\dxwrapper.ini" /RESUME /INSIST /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15.1/components/DXWrapper/dxwrapper.dll" "$INSTDIR\Fun with Pets\SP9\TSBin\dxwrapper.dll" /RESUME /INSIST /END
		NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15.1/components/DXWrapper/d3d9.dll" "$INSTDIR\Fun with Pets\SP9\TSBin\d3d9.dll" /INSIST /END
	SectionEnd
SectionGroupEnd

SectionGroup "Dependencies"
	Section "Visual C++ Redist (x86)" Section7
		SectionInstType ${IT_FULL}

		SetOutPath "$INSTDIR\temp"	
		DetailPrint "Downloading x86 VC Redist..."
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15/components/VC_redist.x86.exe" "$INSTDIR\temp\vc_redist.x86.exe" /RESUME /INSIST /CANCEL /END
		Pop $0
		DetailPrint "VC Redist download status: $0. Executing silently..."
		ExecWait "$INSTDIR\temp\vc_redist.x86.exe /q /norestart"
		Delete "$INSTDIR\temp\vc_redist.x86.exe"
		Pop $0
		DetailPrint "Cleanup result: $0"	
	SectionEnd
		
	Section ".NET Framework" Section8
		SectionInstType ${IT_FULL}

		SetOutPath "$INSTDIR\temp"	
		DetailPrint "Downloading x86 .NET Framework..."
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15/components/ndp48-web.exe" "$INSTDIR\temp\ndp48_web.exe" /RESUME /INSIST /CANCEL /END
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
	SectionInstType ${IT_FULL}

	SetOutPath "$INSTDIR\temp"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15.0.1/components/Store_Content/Preorder-Bonus.7z" "$INSTDIR\temp\Preorder-Bonus.7z" /RESUME /END
		Pop $0
		DetailPrint "Preorder-Bonus.7z download result: $0"		
	SetOutPath "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\Preorder-Bonus.7z" "Extracting Preorder/Exclusive Content %s"
		Pop $0
		DetailPrint "Preorder-Bonus.7z extract result: $0"		

	SetOutPath "$INSTDIR\temp"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15.0.1/components/Store_Content/Downloads.7z.001" "$INSTDIR\temp\Downloads.7z.001" /RESUME /END
		Pop $0
		DetailPrint "Downloads.7z.001 download result: $0"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15.0.1/components/Store_Content/Downloads.7z.002" "$INSTDIR\temp\Downloads.7z.002" /RESUME /END
		Pop $0
		DetailPrint "Downloads.7z.002 download result: $0"
	SetOutPath "$Documents\EA Games\The Sims 2 Ultimate Collection"
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\Downloads.7z.001" "Extracting Store/Bonus Content %s"
		Pop $0
		DetailPrint "Downloads.7z extract result: $0"	

	Delete "$INSTDIR\temp\Preorder-Bonus.7z"
		Pop $0
		DetailPrint "Preorder-Bonus.7z cleanup result: $0"
	Delete "$INSTDIR\temp\Downloads.7z.001"
		Pop $0
		DetailPrint "Downloads.7z.001 cleanup result: $0"
	Delete "$INSTDIR\temp\Downloads.7z.002"
		Pop $0
		DetailPrint "Downloads.7z.002 cleanup result: $0"
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
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15/components/Clean_Templates/BG_Hoods.7z" "$INSTDIR\temp\BG_Hoods.7z" /RESUME /END
		SetOutPath "$INSTDIR"
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\BG_Hoods.7z" "Extracting Base Game Clean Hoods %s"
		Delete "$INSTDIR\temp\BG_Hoods.7z"
		Pop $0
		DetailPrint "BG_Hoods.7z cleanup result: $0"
		SetOutPath "$INSTDIR\temp"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15/components/Clean_Templates/FT_SSNS_Hoods.7z" "$INSTDIR\temp\FT_SSNS_Hoods.7z" /RESUME /END
		SetOutPath "$INSTDIR"
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\FT_SSNS_Hoods.7z" "Extracting FT/Seasons Clean Hoods %s"
		Delete "$INSTDIR\temp\FT_SSNS_Hoods.7z"
		Pop $0
		DetailPrint "FT_SSNS_Hoods.7z cleanup result: $0"
		SetOutPath "$INSTDIR\temp"
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15/components/Clean_Templates/BelladonnaCove.7z" "$INSTDIR\temp\BelladonnaCove.7z" /RESUME /END
		SetOutPath "$INSTDIR"	
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\BelladonnaCove.7z" "Extracting AL Clean Hoods %s"
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
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15/components/Clean_Templates/Subhoods.7z" "$INSTDIR\temp\Subhoods.7z" /RESUME /END
		SetOutPath $INSTDIR 	
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\Subhoods.7z" "Extracting Clean Subhoods %s"
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
		NScurl::http GET "https://github.com/voicemxil/TS2-Starter-Pack/raw/v15/components/Clean_Templates/Stealth_Hoods.7z" "$INSTDIR\temp\Stealth_Hoods.7z" /RESUME /END
		SetOutPath $INSTDIR 			
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\Stealth_Hoods.7z" "Extracting Clean Stealth Hoods %s"
		Delete "$INSTDIR\temp\Stealth_Hoods.7z"
		Pop $0
		DetailPrint "Stealth_Hoods.7z cleanup result: $0"
	SectionEnd
SectionGroupEnd

Section "Start Menu/Desktop Shortcut" Section15
	SectionInstType ${IT_FULL}
	
	SetShellVarContext all
	SetOutPath "$INSTDIR\Fun with Pets\SP9\TSBin"
	CreateDirectory '$SMPROGRAMS\The Sims 2 Starter Pack\'
	CreateShortCut '$SMPROGRAMS\The Sims 2 Starter Pack\The Sims 2 (Sims2RPC).lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' 0
	CreateShortCut '$SMPROGRAMS\The Sims 2 Starter Pack\Sims2RPC Settings.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPCSettings.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPCSettings.exe' 0
	CreateShortCut '$Desktop\The Sims 2 (Sims2RPC).lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' 0
	CreateShortCut '$Desktop\Sims2RPC Settings.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPCSettings.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPCSettings.exe' 0
	SetOutPath "$INSTDIR\Fun with Pets\SP9\CSBin"
	CreateShortCut '$SMPROGRAMS\The Sims 2 Starter Pack\The Sims 2 Body Shop.lnk' '$INSTDIR\Fun with Pets\SP9\CSBin\TS2BodyShop.exe'

	${If} ${SectionIsSelected} ${Section3}
		SetOutPath "$INSTDIR\Graphics Rules Maker\Bin"
		CreateShortCut '$SMPROGRAMS\The Sims 2 Starter Pack\Graphics Rules Maker.lnk' '$INSTDIR\Graphics Rules Maker\Bin\GraphicsRulesMakerUi.exe' "" '$INSTDIR\Graphics Rules Maker\Bin\GraphicsRulesMakerUi.exe' 0 
	${EndIf}
SectionEnd 

Section
	RMDir /r "$INSTDIR\temp"
	SetOutPath "$INSTDIR\Fun with Pets\SP9\TSBin"
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
	RMDir /r "$R4\Language_Selection"
	RMDir /r "$R4\Graphics Rules Maker"

    ${EndIf}
	DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2"
	DeleteRegKey HKLM32 "SOFTWARE\EA GAMES\The Sims 2 Fun with Pets Collection"
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

	DeleteRegKey HKLM32 "Software\Microsoft\Windows\CurrentVersion\Uninstall\The Sims 2 Starter Pack"
	DeleteRegKey HKLM32 "Software\Microsoft\Windows\CurrentVersion\Uninstall\The Sims 2 Ultimate Collection"
	RMDir /r "$SMPROGRAMS\The Sims 2 Starter Pack"
	Delete "$Desktop\The Sims 2 (Sims2RPC).lnk"
	Delete "$Desktop\Sims2RPC Settings.lnk"
SectionEnd

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${Section2} "Installs The Sims 2 Ultimate Collection w/ fixes and Sims2RPC v1.15."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section1} "Installs alternate version of the game files with cleanup script by lingeringwillx. Reduces game file size by 2.44GB by removing duplicate files. However, be warned: this version may have issues not present in the original version such as issues with SimPE/TS2Hook."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section3} "Installs SimNopke's Sim Shadow Fix to your Downloads folder for Windows 8 or higher. (Not needed if installing DXVK)"
  !insertmacro MUI_DESCRIPTION_TEXT ${Section4} "Installs Graphics Rules Maker."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section5} "Installs Lazy Duchess's Bright CAS Fix to your install folder."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section6} "Installs DXVK $DXVKVER. Recommended on modern AMD graphics cards (RX 400+) to prevent a long loading screen bug. Otherwise, only select if you know you have Vulkan-capable hardware and a specific reason to use it. (When using this option, you do not need the Sim Shadow Fix. If it causes graphical issues, remove d3d9.dll from $\"Fun with Pets\SP9\TSBin.$\")"
  !insertmacro MUI_DESCRIPTION_TEXT ${Section7} "Installs Visual C++ Redist (x86) if not already installed. (Required by the game)"
  !insertmacro MUI_DESCRIPTION_TEXT ${Section8} "Installs .NET Framework if not already installed. (Required for Sims2RPC)"
  !insertmacro MUI_DESCRIPTION_TEXT ${Section9} "Installs the Sims 2 Store and pre-order/bonus content."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section10} "Installs cleaned versions of the main neighborhoods. Pleasantview, Veronaville, Riverblossom Hills, Desiderata Valley, & Belladonna Cove by zachjohnunlimited on MTS, Strangetown by Dorsal Axe on MTS."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section11} "Installs cleaned Subhoods - this includes Downtown by @meetmetotheriver and Shopping Districts/Universities by zachjohnunlimited on MTS."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section12} "Installs cleaned Stealth Hoods by @meetmetotheriver."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section13} "Installs DXWrapper, ForceD3d9on12: in order to support shadows without crashing on the latest Intel graphics (Arc, UHD, Iris) which lack full DX9 support."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section15} "Create a shortuct to launch the game in your Start Menu/Desktop."
!insertmacro MUI_FUNCTION_DESCRIPTION_END
