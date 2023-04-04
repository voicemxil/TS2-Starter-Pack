  Unicode true
Target amd64-unicode

;Include header files
!define MUI_WELCOMEFINISHPAGE_BITMAP "..\assets\InstallerImage.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "..\assets\InstallerImage.bmp"
!include "ModernXL.nsh"
!include "MUI2.nsh"
!include "x64.nsh"

!include ".\Language-r.nsh"
!include ".\Touchup-er.nsh"

########################### Installer SETUP
Name "The Sims 2 Starter Pack - Standalone"
OutFile "..\bin\Standalone Installer\TS2-StandaloneInstaller.v12.x64.exe"
RequestExecutionLevel admin
InstallDir "$PROGRAMFILES32\The Sims 2 Starter Pack\"
SetCompressor /SOLID LZMA
ShowInstDetails show
ManifestDPIAware True
VIProductVersion 12.0.0.0
VIAddVersionKey "CompanyName" "osab"
VIAddVersionKey "FileVersion" "12.0.0"
VIAddVersionKey "ProductName" "The Sims 2 Starter Pack"
VIAddVersionKey "ProductVersion" "12.0"

########################### MUI SETUP
brandingText "osab Standalone Installer v12"
!define MUI_ABORTWARNING
!define MUI_INSTFILESPAGE_COLORS "FFFFFF 000000"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_RIGHT
!define MUI_HEADERIMAGE_BITMAP "..\assets\header.bmp"
!define MUI_HEADERIMAGE_BITMAP_STRETCH AspectFitHeight
!define MUI_ICON "..\assets\NewInstaller.ico"
!define MUI_PAGE_HEADER_TEXT "TS2: Starter Pack - Standalone"
!define MUI_PAGE_HEADER_SUBTEXT "Touchup installer for Standalone TS2:UC, by osab."
!define MUI_WELCOMEPAGE_TITLE "Install The Sims 2 Starter Pack (Standalone)"
!define MUI_WELCOMEPAGE_TEXT "This installer is for the standalone download of The Sims 2: Ultimate Collection - it does NOT download the game files itself. $\nFor an all-in-one download and installation, use the Web Installer instead. $\n$\nThis installs the game in English. To change the game language, you can run one of the registry files in the $\"_Language Selection$\" folder. $\n$\nPlease set the install directory to your Sims 2 root folder where you've extracted the game files."
!define MUI_UNCONFIRMPAGE_TEXT_TOP "WARNING: Before uninstalling, make sure the folder you chose contains ONLY the uninstaller and game files. The game files MUST be in their own separate folder with no other essential data! I am not responsible for any data loss!"
!define MUI_LICENSEPAGE_TEXT_TOP "License Information:"
!define MUI_DIRECTORYPAGE_TEXT_DESTINATION "The folder you choose should contain the game packs such as $\"Fun with Pets.$\""
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
            ReadRegStr $R4 HKLM32 "SOFTWARE\EA GAMES\The Sims 2" "Install Dir" 
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
InstType "AMD Graphics preset" IT_AMD
InstType "Minimal (Linux/WINE optimized)" IT_MIN

Section "Touchup & Sims2RPC" Section1
SectionInstType ${IT_FULL} ${IT_AMD} ${IT_MIN}
SectionIn RO 
SetOutPath $INSTDIR
InitPluginsDir
SetOverwrite ifnewer

!insertmacro RemovePreviousInstall

# Touchup
!insertmacro touchup "The Sims 2 Ultimate Collection" "EA GAMES\The Sims 2" "{04450C18-F039-4B81-A621-70C3B0F523D5}" "Sims2EP9.exe"

SetOutPath "$INSTDIR\Double Deluxe\Base\TSData\Res\Catalog\Bins"
File "..\components\holiday\H05.bundle.package"
SetOutPath "$INSTDIR\Double Deluxe\Base\TSData\Res\Catalog\Skins"
File "..\components\holiday\Skins.package"

CreateDirectory "$INSTDIR\temp"
SetOutPath "$INSTDIR\temp"
DetailPrint "Installing Sims2RPC..."
File "..\components\SFX_Sims2RPC_1.15.exe"
ExecWait '"SFX_Sims2RPC_1.15.exe" -InstallPath=".\" -o".\" -y -gm1'
Pop $0
DetailPrint "RPC extraction status: $0."

DetailPrint "Cleaning up RPC zip file..."
Delete "SFX_Sims2RPC_1.15.exe"

!insertmacro setLanguage "EA GAMES\The Sims 2" # macro takes in ts2 registry key
File /r "..\components\language-selection" 

DetailPrint "Creating Downloads folder..."
CreateDirectory "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
WriteUninstaller "$INSTDIR\Uninstall The Sims 2 Starter Pack.exe"
SectionEnd

Section "Graphics Rules Maker" Section2
	SectionInstType ${IT_FULL} ${IT_AMD} ${IT_MIN}

	SetOutPath "$INSTDIR\temp"
	${If} ${RunningX64}
		File "..\components\graphicsrulesmaker-2.0.0-64bit.exe"
		Pop $0 # return value = exit code, "OK" means OK
		Rename graphicsrulesmaker-2.0.0-64bit.exe grm_install.exe
		DetailPrint "GRM extract status: $0. Executing installer..." 
	${Else}
		File "..\components\graphicsrulesmaker-2.0.0-32bit.exe"
		Pop $0 
		Rename graphicsrulesmaker-2.0.0-32bit.exe grm_install.exe
		DetailPrint "GRM extract status: $0. Executing installer..." 
	${EndIf}
	Execwait "grm_install.exe"
	DetailPrint "Cleaning up GRM installer..."
	Delete "grm_install.exe"
SectionEnd

Section /o "DXVK" Section3
	SectionInstType ${IT_AMD} 

	SetOutPath "$INSTDIR\temp"

	File "..\components\vulkan_test.exe"
	ExecWait "$INSTDIR\temp\vulkan_test.exe"
	Delete "$INSTDIR\temp\vulkan_test.exe"

	MessageBox MB_YESNO "DXVK requires Vulkan support. If the message box said it successfully created a Vulkan instance, click Yes. Otherwise, click NO." IDYES true IDNO false
	true: 
		SetOutPath "$INSTDIR\Fun with Pets\SP9\TSBin"
		DetailPrint "Extracting DXVK 2.1..."
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

Section "Visual C++ Redist" Section4
	SectionInstType ${IT_FULL} ${IT_AMD}

	SetOutPath "$INSTDIR\temp"
	File "..\components\vc_redist.x86.exe"
	Pop $0
	DetailPrint "VC Redist extract status: $0"
	ExecWait "$INSTDIR\temp\vc_redist.x86.exe /q /norestart"
	Delete "$INSTDIR\temp\vc_redist.x86.exe"
SectionEnd
	
Section ".NET Framework" Section5
	SectionInstType ${IT_FULL} ${IT_AMD}

	SetOutPath "$INSTDIR\temp"
	File "..\components\ndp48-web.exe"
	Pop $0
	DetailPrint ".NET Framework extract status: $0"
	ExecWait "$INSTDIR\temp\ndp48-web.exe /q /norestart"
	Delete "$INSTDIR\temp\ndp48-web.exe"
SectionEnd

Section "Sim Shadow Fix" Section6
	SectionInstType ${IT_FULL}

	SetOutPath "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
	File "..\components\simNopke-simShadowFix0.3reallyNotMisty.package"
	ExecShell "open" "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
SectionEnd

Section "Start Menu/Desktop Shortcut" Section7
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
!insertmacro MUI_DESCRIPTION_TEXT ${Section1} "Touches up your local copy of The Sims 2 Ultimate Collection and installs Sims2RPC v1.15."
!insertmacro MUI_DESCRIPTION_TEXT ${Section2} "Installs Graphics Rules Maker 2.0.0."
!insertmacro MUI_DESCRIPTION_TEXT ${Section3} "Installs DXVK 2.1. (Not recommended for beginners.)"
!insertmacro MUI_DESCRIPTION_TEXT ${Section4} "Installs Visual C++ Redist (x86) if not already installed."
!insertmacro MUI_DESCRIPTION_TEXT ${Section5} "Installs .NET Framework if not already installed."
!insertmacro MUI_DESCRIPTION_TEXT ${Section6} "Installs SimNopke's Sim Shadow Fix to your downloads folder. *Don't Use With DXVK*."
!insertmacro MUI_DESCRIPTION_TEXT ${Section7} "Create a shortuct to launch the game in your Start Menu/Desktop."
!insertmacro MUI_FUNCTION_DESCRIPTION_END
