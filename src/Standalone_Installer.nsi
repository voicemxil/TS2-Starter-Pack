Unicode true
Target x86-unicode
; Target amd64-unicode

# Installer SETUP
!define MUI_WELCOMEFINISHPAGE_BITMAP "..\assets\StandaloneInstallerImage.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "..\assets\StandaloneInstallerImage.bmp"
!include "ModernXL.nsh"
!include "MUI2.nsh"
!include "x64.nsh"
!include "WinVer.nsh"
!include ".\Language.nsh"
!include ".\Touchup.nsh"

Name "The Sims 2 Starter Pack - Standalone Touchup Installer"
OutFile "..\bin\Standalone Installer\UCTouchup-StandaloneInstaller.x32.exe"
RequestExecutionLevel admin
InstallDir "$PROGRAMFILES32\The Sims 2 Starter Pack\"
SetCompressor /SOLID LZMA
ManifestDPIAware True
VIProductVersion 15.0.2.0
VIAddVersionKey "CompanyName" "osab"
VIAddVersionKey "FileVersion" "15.0.2"
VIAddVersionKey "ProductName" "The Sims 2 Starter Pack"
VIAddVersionKey "ProductVersion" "15.0.2"

# MUI SETUP
brandingText "osab Standalone Installer v15"
!define MUI_ABORTWARNING
!define MUI_INSTFILESPAGE_COLORS "FFFFFF 000000"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_RIGHT
!define MUI_HEADERIMAGE_BITMAP "..\assets\header.bmp"
!define MUI_HEADERIMAGE_BITMAP_STRETCH AspectFitHeight
!define MUI_ICON "..\assets\StandaloneInstaller.ico"
!define MUI_PAGE_HEADER_TEXT "TS2 Starter Pack: Standalone Touchup Installer"
!define MUI_PAGE_HEADER_SUBTEXT "Touchup installer for Standalone TS2:UC, by osab."
!define MUI_WELCOMEPAGE_TITLE "The Sims 2 Starter Pack: Standalone Touchup Installer"
!define MUI_WELCOMEPAGE_TEXT "This is the standalone Starter Pack install script for use with the separate download of The Sims 2: Ultimate Collection. It does NOT download the game files for you. $\n$\nFor the best first-time install experience wth all-in-one download and installation, use the Web Installer instead. $\n$\nThis installer guesses the game language based on your system locale, however you can change it if needed by applying the registry files in the included $\"_Language Selection$\" folder. $\n$\nPlease set the install directory to your $\"The Sims 2 Starter Pack$\" root folder where you've extracted the game files."
!define MUI_UNCONFIRMPAGE_TEXT_TOP "WARNING: Before uninstalling, make sure the folder you chose contains ONLY the uninstaller and game files. The game files MUST be in their own separate folder with no other essential data! I am not responsible for any data loss!"
!define MUI_LICENSEPAGE_TEXT_TOP "License Information:"
!define MUI_DIRECTORYPAGE_TEXT_DESTINATION "The folder you choose should contain the game packs such as $\"Fun with Pets.$\""
!define MUI_FINISHPAGE_SHOWREADME "https://docs.google.com/document/d/1UT0HX3cO4xLft2KozGypU_N7ZcGQVr-54QD9asFsx5U/edit#heading=h.6jnaz4t6d3vx"
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

# Begin Installation
!macro RemovePreviousInstall
    SetRegView 32
    ClearErrors
    EnumRegKey $0 HKLM32 "SOFTWARE\EA GAMES\The Sims 2" 0
IfErrors keydontexist keyexists
goto noo
keyexists:
        ReadRegStr $R4 HKLM32 "SOFTWARE\EA GAMES\The Sims 2" "Install Dir" 
        MessageBox MB_YESNO|MB_ICONEXCLAMATION "A previous installation of The Sims 2 was detected on this system. Leaving behind remnants in the registry can cause unwanted behavior. Would you like the installer to remove the conflicting registry keys?$\n$\nWARNING: this will remove the keys we detected, rendering the old installation unplayable. Your game file and save file directories will not be affected." IDYES si IDNO noo
si:
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
			DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\The Sims 2 Ulitmate Collection"
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

InstType "Full (Choose if unsure)" IT_FULL	
Section "Touchup & Sims2RPC" Section1
	SectionInstType ${IT_FULL}
	SectionIn RO 
	SetOutPath $INSTDIR
	InitPluginsDir
	SetOverwrite on

	!insertmacro RemovePreviousInstall

	# Touchup
	!insertmacro touchup "The Sims 2 Ultimate Collection" "EA GAMES\The Sims 2" "{04450C18-F039-4B81-A621-70C3B0F523D5}" "Sims2EP9.exe"

	SetOutPath "$INSTDIR\Fun with Pets\SP9\TSBin"
	File "/oname=Sims2EP9RPC.exe" "..\components\Sims2EP9.exe"

	# Patch missing items from Holiday pack
	SetOutPath "$INSTDIR\Double Deluxe\Base\TSData\Res\Catalog\Bins"
	File "..\components\Patch_HolidayFix\H05.bundle.package"
	SetOutPath "$INSTDIR\Double Deluxe\Base\TSData\Res\Catalog\Skins"
	File "..\components\Patch_HolidayFix\Skins.package"

	# Patch AL/MG UI Text
	SetOutPath "$INSTDIR"
	File /r "..\components\Patch_UITextFix\Apartment Life"
	File /r "..\components\Patch_UITextFix\Fun with Pets"

	# Install Sims2RPC
	CreateDirectory "$INSTDIR\temp"
	SetOutPath "$INSTDIR\temp"
	DetailPrint "Installing Sims2RPC..."
	File "..\components\Sims2RPC_1.15.7z"
	SetOutPath "$INSTDIR"
	Nsis7z::ExtractWithDetails "$INSTDIR\temp\Sims2RPC_1.15.7z" "%s"
	Pop $0
	DetailPrint "RPC extraction status: $0."
	DetailPrint "Cleaning up RPC zip file..."
	Delete "Sims2RPC_1.15.7z"

	# Unlocked Pet Breeds
	SetOutPath $INSTDIR 
	File /r "..\components\Patch_PetBreeds\Fun with Pets"

	# LdDarcy Pie Menu Text Strings Fix
	SetOutPath "$INSTDIR\Fun with Pets\SP9\TSData\Res\UI"
	FIle "..\components\LdDarcy_PieMenuTextStringsFix.package"

	# Downloads Folder
	DetailPrint "Creating Downloads folder..."
	CreateDirectory "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads" 

	# Autodetect Launguage
	SetOutPath $INSTDIR
	!insertmacro setLanguage "EA GAMES\The Sims 2" # macro takes in ts2 registry key
	DetailPrint "Adding Language Selection files to game folder..."

	# Language Selection Files
	File /r "..\components\Language_Selection" 

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
	SetOutPath "$INSTDIR\temp"
	File "..\components\CEP\zCEP-EXTRA_Documents.7z"
	File "..\components\CEP\zCEP-EXTRA_ProgramFiles.7z"
	SetOutPath "$Documents\EA Games\The Sims 2 Ultimate Collection"
	Nsis7z::ExtractWithDetails "$INSTDIR\temp\zCEP-EXTRA_Documents.7z" "%s"
	SetOutPath "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
	File "..\components\CEP\_EnableColorOptionsGMND.package"
	SetOutPath "$INSTDIR\Double Deluxe\Base\TSData\Res\Sims3D"
	File "..\components\CEP\_EnableColorOptionsMMAT.package"
	SetOutPath "$INSTDIR\Double Deluxe\Base\TSData\Res\Catalog"
	Nsis7z::ExtractWithDetails "zCEP-EXTRA_ProgramFiles.7z" "%s"
	Delete "$INSTDIR\temp\zCEP-EXTRA_Documents.7z"
	Delete "$INSTDIR\temp\zCEP-EXTRA_ProgramFiles.7z"

	# Create Uninstaller
	SetOutPath $INSTDIR
	WriteUninstaller "$INSTDIR\Uninstall The Sims 2 Starter Pack.exe"
SectionEnd

SectionGroup /e "Graphical Fixes\Tweaks"
	Section "Graphics Rules Maker" Section3
		SetOutPath "$INSTDIR\temp"
		File "..\components\GRM-win64.7z"

		SetOutPath "$INSTDIR"
		Nsis7z::ExtractWithDetails "$INSTDIR\temp\GRM-win64.7z" "Extracting GRM."
		Pop $0
		DetailPrint "GRM extract status: $0." 

		Delete "$INSTDIR\temp\GRM-win64.7z"

		MessageBox MB_OK "Graphics Rules Maker will now open. Select $\"The Sims 2$\" from the $\"Game$\" dropdown and choose the $\"Auto-detect$\" option, then $\"Save Files.$\" Repeat the process for $\"The Sims 2 Body Shop$\" and then exit the program to continue."
		SetOutPath "$INSTDIR\Graphics Rules Maker\bin"
		Execwait "$INSTDIR\Graphics Rules Maker\bin\GraphicsRulesMakerUi.exe"
	SectionEnd

	Section /o "DXVK" Section4

		SetOutPath "$INSTDIR\temp"

		File "..\components\vulkan_test.exe"
		ExecWait "$INSTDIR\temp\vulkan_test.exe"
		Delete "$INSTDIR\temp\vulkan_test.exe"

		MessageBox MB_YESNO "DXVK requires Vulkan support. If the message box said it successfully created a Vulkan instance, click Yes. Otherwise, click NO." IDYES true IDNO false
		true: 
			SetOutPath "$INSTDIR\Fun with Pets\SP9\TSBin"
			DetailPrint "Extracting DXVK 2.4.1..."
			File "..\components\d3d9.dll"
			Pop $0 # return value = exit code, "OK" means OK
			DetailPrint "DXVK extract status: $0."

			File "..\components\dxvk.conf"
			Pop $0
			DetailPrint "DXVK.conf extrtact status: $0." 
			goto next
		false:
			DetailPrint "Vulkan is unsupported, DXVK will be skipped."
		next:
	SectionEnd

	Section "Sim Shadow Fix" Section5
		SectionInstType ${IT_FULL}
		${If} ${IsWin7}
		${OrIf} ${IsWinVista}
		${OrIf} ${IsWinXP}
			DetailPrint "Shadow Fix skipped due to being unnecessary for this Windows version."
		${Else}
		SetOutPath "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
		File "..\components\simNopke-simShadowFix0.3reallyNotMisty.package"
		ExecShell "open" "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
		${EndIf}
	SectionEnd

	Section "LD Bright CAS Fix" Section6
		SectionInstType ${IT_FULL}
		SetOutPath "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
		File /r "..\components\ld_BrightCASFix.package"
	SectionEnd
SectionGroupEnd

SectionGroup "Dependencies"
	Section "Visual C++ Redist" Section11
		SectionInstType ${IT_FULL}

		SetOutPath "$INSTDIR\temp"
		File "..\components\vc_redist.x86.exe"
		Pop $0
		DetailPrint "VC Redist extract status: $0"
		ExecWait "$INSTDIR\temp\vc_redist.x86.exe /q /norestart"
		Delete "$INSTDIR\temp\vc_redist.x86.exe"
	SectionEnd
		
	Section ".NET Framework" Section12
		SectionInstType ${IT_FULL}

		SetOutPath "$INSTDIR\temp"
		File "..\components\ndp48-web.exe"
		Pop $0
		DetailPrint ".NET Framework extract status: $0"
		ExecWait "$INSTDIR\temp\ndp48-web.exe /q /norestart"
		Delete "$INSTDIR\temp\ndp48-web.exe"
	SectionEnd
SectionGroupEnd

Section "Start Menu/Desktop Shortcut" Section13
	SectionInstType ${IT_FULL}
	SetShellVarContext all

	SetOutPath "$INSTDIR\Fun with Pets\SP9\TSBin"
	CreateDirectory '$SMPROGRAMS\The Sims 2 Starter Pack\'
	CreateShortCut '$SMPROGRAMS\The Sims 2 Starter Pack\The Sims 2 (Sims2RPC).lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' 0
	CreateShortCut '$SMPROGRAMS\The Sims 2 Starter Pack\Sims2RPC Settings.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPCSettings.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPCSettings.exe' 0

	CreateShortCut '$Desktop\The Sims 2 (Sims2RPC).lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' 0
	CreateShortCut '$Desktop\Sims2RPC Settings.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPCSettings.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPCSettings.exe' 0

	${If} ${SectionIsSelected} ${Section3}
		SetOutPath "$INSTDIR\Graphics Rules Maker\Bin"
		CreateShortCut '$SMPROGRAMS\The Sims 2 Starter Pack\Graphics Rules Maker.lnk' '$INSTDIR\Graphics Rules Maker\Bin\GraphicsRulesMakerUi.exe' "" '$INSTDIR\Graphics Rules Maker\Bin\GraphicsRulesMakerUi.exe' 0 
	${EndIf}
SectionEnd 

Section
	ExecShell "open" "$INSTDIR\Fun with Pets\SP9\TSBin"
	RMDir /r "$INSTDIR\temp"
SectionEnd

Section "Uninstall" Section8
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
	RMDir /r "$R4\Graphics Rules Maker"

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
	Delete "$Desktop\The Sims 2 (Sims2RPC).lnk"
	Delete "$Desktop\Sims2RPC Settings.lnk"
SectionEnd

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
!insertmacro MUI_DESCRIPTION_TEXT ${Section1} "Touches up your local copy of The Sims 2 Ultimate Collection and installs Sims2RPC v1.15."
!insertmacro MUI_DESCRIPTION_TEXT ${Section3} "Installs Graphics Rules Maker."
!insertmacro MUI_DESCRIPTION_TEXT ${Section4} "Installs DXVK 2.4.1. (Not recommended for beginners.)"
!insertmacro MUI_DESCRIPTION_TEXT ${Section5} "Installs SimNopke's Sim Shadow Fix to your downloads folder for Windows 8 or higher. *Don't Use With DXVK*."
!insertmacro MUI_DESCRIPTION_TEXT ${Section6} "Installs Lazy Duchess's Bright CAS Fix to your Downloads folder."
!insertmacro MUI_DESCRIPTION_TEXT ${Section11} "Installs Visual C++ Redist (x86) if not already installed."
!insertmacro MUI_DESCRIPTION_TEXT ${Section12} "Installs .NET Framework if not already installed."
!insertmacro MUI_DESCRIPTION_TEXT ${Section13} "Create a shortuct to launch the game in your Start Menu/Desktop."
!insertmacro MUI_FUNCTION_DESCRIPTION_END
