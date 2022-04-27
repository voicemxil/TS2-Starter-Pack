!include "MUI2.nsh"


# Names the built installer
Name "TS2 Touchup"
# Building to:
OutFile "TS2 Touchup Launcher.exe"
# Administrator Privileges 
RequestExecutionLevel admin
# Default Installation Directory
InstallDir "$PROGRAMFILES32\The Sims 2 Starter Pack\"

###########################
!define MUI_ABORTWARNING
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP_STRETCH AspectFitHeight
!define MUI_HEADERIMAGE_BITMAP "B:\Pictures\banner.bmp"
!define MUI_ICON "B:\Pictures\simmm.ico"
!define MUI_PAGE_HEADER_TEXT "TS2: UC - Touchup Installer"
!define MUI_PAGE_HEADER_SUBTEXT "Installer for Standalone TS2:UC, by osab."


!define MUI_WELCOMEPAGE_TITLE "Install The Sims 2 (Standalone)"
!define MUI_WELCOMEPAGE_TEXT "This installs the game in English. To change the game language, please follow the tutorial linked in the wiki. Set the directory to your game (Sims 2) root folder."

!define MUI_LICENSEPAGE_TEXT_TOP ""

!define MUI_FINISHPAGE_LINK_LOCATION "discord.gg/zzjHj2jxHV"
!define MUI_WELCOMEFINISHPAGE_BITMAP "B:\Pictures\orange.bmp"
!define MUI_FINISHPAGE_SHOWREADME "https://docs.google.com/document/d/1UT0HX3cO4xLft2KozGypU_N7ZcGQVr-54QD9asFsx5U/edit#heading=h.6jnaz4t6d3vx"
!define MUI_FINISHPAGE_SHOWREADME_NOTCHECKED
!define MUI_FINISHPAGE_SHOWREADME_TEXT "Open the next step of the guide"
!define MUI_FINISHPAGE_NOREBOOTSUPPORT
!define MUI_FINISHPAGE_LINK "Discord Server!"

!insertmacro MUI_PAGE_WELCOME
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

	DetailPrint "Downloading RPC installer..."
inetc::get /BANNER "Downloading Sims2RPC Web Installer... Choose Install/Repair when it pops up." "https://cdn.simfileshare.net/download/2745478/?dl" "Sims2RPC Web Installer.zip"
	Pop $0
	DetailPrint "RPC download status: $0"
nsisunz::UnzipToLog "Sims2RPC Web Installer.zip" "$INSTDIR"
Pop $0
DetailPrint "RPC extraction status: $0. Cleaning up zip file..." ;print error message to log
Delete "Sims2RPC Web Installer.zip"
DetailPrint "Attempting to execute RPC Installer... Please click 'Install/Repair.'"
ExecWait '"Sims2RPCInstaller.exe"'
Delete "Sims2RPCInstaller.exe"
		
SectionEnd

Section "Start Menu Shortcut" Section4
	SetShellVarContext current
	CreateDirectory '$SMPROGRAMS\The Sims 2 Starter Pack\'
	CreateShortCut '$SMPROGRAMS\The Sims 2 Starter Pack\Launch Sims2RPC.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' 0
SectionEnd

Section "Desktop Shortcut" Section5
	SetShellVarContext current
    CreateShortCut '$DESKTOP\Launch Sims2RPC.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe'
SectionEnd

LangString DESC_Section1 ${LANG_ENGLISH} "Installs TS2:UC via Touchup file from a standalone download, then installs/updates Sims2RPC."
LangString DESC_Section4 ${LANG_ENGLISH} "Create a shortuct to launch the game in your Start menu."
LangString DESC_Section5 ${LANG_ENGLISH} "Create a shortcut to launch the game on your desktop."
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${Section1} $(DESC_Section1)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section4} $(DESC_Section4)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section5} $(DESC_Section5)

!insertmacro MUI_FUNCTION_DESCRIPTION_END
