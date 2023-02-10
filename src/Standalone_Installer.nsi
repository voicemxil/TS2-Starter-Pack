Unicode true
!include "MUI2.nsh"
!include "x64.nsh"

Name "The Sims 2 Starter Pack - Stanalone Installer"
OutFile "..\bin\Standalone Installer\TS2.StandaloneInstaller-v10.exe"
RequestExecutionLevel admin
InstallDir "$PROGRAMFILES32\The Sims 2 Starter Pack\"

###########################
!define MUI_ABORTWARNING
!define MUI_HEADERIMAGE_RIGHT
!define MUI_HEADERIMAGE_BITMAP_STRETCH AspectFitHeight
!define MUI_HEADERIMAGE_BITMAP "..\assets\header.bmp"
!define MUI_ICON "..\assets\NewInstaller.ico"
!define MUI_PAGE_HEADER_TEXT "TS2: Starter Pack - Standalone Installer"
!define MUI_PAGE_HEADER_SUBTEXT "Touchup installer for Standalone TS2:UC, by osab."

!define MUI_WELCOMEPAGE_TITLE "Install The Sims 2 (Standalone)"
!define MUI_WELCOMEPAGE_TEXT "This installer is for the standalone download of The Sims 2: Starter Pack (or UC) - it does NOT download the game files. For an all-in-one installation, use the Web Installer instead. This installs the game in English. To change the game language, please follow the tutorial linked in the wiki. Set the directory to your game (Sims 2) root folder."

!define MUI_LICENSEPAGE_TEXT_TOP "License Information:"

!define MUI_WELCOMEFINISHPAGE_BITMAP "..\assets\v10.bmp"
!define MUI_FINISHPAGE_SHOWREADME "https://docs.google.com/document/d/1UT0HX3cO4xLft2KozGypU_N7ZcGQVr-54QD9asFsx5U/edit#heading=h.6jnaz4t6d3vx"
!define MUI_FINISHPAGE_SHOWREADME_TEXT "Open the next step of the guide (Graphics Setup)?"
!define MUI_FINISHPAGE_NOREBOOTSUPPORT
!define MUI_FINISHPAGE_LINK "TS2 Community Discord Server!"
!define MUI_FINISHPAGE_LINK_LOCATION "https://discord.gg/invite/ts2-community-912700195249197086"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "C:\Users\c\Documents\GitHub\TS2-Starter-Pack\LICENSE.txt"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

Section "Touchup & Sims2RPC" Section1
SectionIn RO 
SetOutPath $INSTDIR
InitPluginsDir
SetOverwrite ifnewer

DetailPrint "Touching Up..."
Execwait '"$INSTDIR\__Installer\Touchup.exe" install -locale en_US -installPath "$INSTDIR" -autologging'

CreateDirectory "$INSTDIR\temp"
SetOutPath "$INSTDIR\temp"
DetailPrint "Installing Sims2RPC..."
File "..\components\SFX_Sims2RPC_1.15.exe"
ExecWait '"SFX_Sims2RPC_1.15.exe" -InstallPath=".\" -o".\" -y -gm1'
Pop $0
DetailPrint "RPC extraction status: $0."

DetailPrint "Cleaning up RPC zip file..."
Delete "SFX_Sims2RPC_1.15.exe"
RMDIR "$INSTDIR\temp"

DetailPrint "Extracting Language Selection Files."
File /r "C:\Users\c\Documents\GitHub\TS2-Starter-Pack\language-selection" 

DetailPrint "Tweaking Registry for compatibility..."
WriteRegStr HKLM32 "Software\EA GAMES\The Sims 2" "DisplayName" "The Sims 2 Ultimate Collection"
DetailPrint "Creating Downloads folder..."
CreateDirectory "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
SectionEnd

Section "Graphics Rules Maker" Section2
CreateDirectory "$INSTDIR\temp"
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
	SetOutPath $INSTDIR
	RMDir /r "$INSTDIR\temp"
SectionEnd

Section /o "DXVK" Section3
	CreateDirectory "$INSTDIR\temp"
	SetOutPath "$INSTDIR\temp"
	File "..\components\vulkan_test.exe"
	ExecWait "$INSTDIR\temp\vulkan_test.exe"
	Delete "$INSTDIR\temp\vulkan_test.exe"
	RMDir /r "$INSTDIR\temp"
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
	false:
		DetailPrint "Vulkan is unsupported, DXVK will be skipped."
	next:
		DetailPrint "DXVK section complete."
SectionEnd

Section "Visual C++ Redist" Section4
	CreateDirectory "$INSTDIR\temp"	
	SetOutPath "$INSTDIR\temp"
	File "..\components\vc_redist.x86.exe"
	Pop $0
	DetailPrint "VC Redist extract status: $0"
	ExecWait "$INSTDIR\temp\vc_redist.x86.exe /q /norestart"
	Delete "$INSTDIR\temp\vc_redist.x86.exe"
	RMDir /r "$INSTDIR\temp"
SectionEnd
	
Section ".NET Framework" Section5
	CreateDirectory "$INSTDIR\temp"
	SetOutPath "$INSTDIR\temp"
	File "..\components\ndp48-web.exe"
	Pop $0
	DetailPrint ".NET Framework extract status: $0"
	ExecWait "$INSTDIR\temp\ndp48-web.exe /q /norestart"
	Delete "$INSTDIR\temp\ndp48-web.exe"
	RMDir /r "$INSTDIR\temp"
SectionEnd

Section "Sim Shadow Fix" Section6
	SetOutPath "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
	File "..\components\simNopke-simShadowFix0.3reallyNotMisty.package"
	ExecShell "open" "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
SectionEnd

Section "Start Menu/Desktop Shortcut" Section7
	SetShellVarContext current
	SetOutPath "$INSTDIR\Fun with Pets\SP9\TSBin"
	CreateDirectory '$SMPROGRAMS\The Sims 2 Starter Pack\'
	CreateShortCut '$SMPROGRAMS\The Sims 2 Starter Pack\Sims2RPC.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' 0
	CreateShortCut '$Desktop\Sims2RPC.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' 0
SectionEnd 

LangString DESC_Section1 ${LANG_ENGLISH} "Touches up your local copy of The Sims 2 Ultimate Collection and installs Sims2RPC v1.15."
LangString DESC_Section2 ${LANG_ENGLISH} "Installs Graphics Rules Maker 2.0.0."
LangString DESC_Section3 ${LANG_ENGLISH} "Installs DXVK 2.1. (Not recommended for beginners.)"
LangString DESC_Section4 ${LANG_ENGLISH} "Installs Visual C++ Redist (x86) if not already installed."
LangString DESC_Section5 ${LANG_ENGLISH} "Installs .NET Framework if not already installed."
LangString DESC_Section6 ${LANG_ENGLISH} "Installs SimNopke's Sim Shadow Fix to your downloads folder. *Don't Use With DXVK*."
LangString DESC_Section7 ${LANG_ENGLISH} "Create a shortuct to launch the game in your Start Menu/Desktop."

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${Section1} $(DESC_Section1)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section2} $(DESC_Section2)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section3} $(DESC_Section3)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section4} $(DESC_Section4)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section5} $(DESC_Section5)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section6} $(DESC_Section6)	
  !insertmacro MUI_DESCRIPTION_TEXT ${Section7} $(DESC_Section7)

!insertmacro MUI_FUNCTION_DESCRIPTION_END
