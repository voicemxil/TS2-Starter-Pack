!include "MUI2.nsh"

Var Installer
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
Var DXVKVER

# Names the built installer
Name "The Sims 2 Starter Pack by osab"
# Building to:
OutFile "TS2StarterPack.WebInstaller-v7.exe"
# Administrator Privileges 
RequestExecutionLevel admin
# Default Installation Directory
InstallDir "$PROGRAMFILES32\The Sims 2 Starter Pack"

Function StoreDXVKVersion
	StrCpy $DXVKVER "1.10.1"
FunctionEnd

Function .OnInit
	Dialer::AttemptConnect
	Call StoreDXVKVersion
FunctionEnd



###########################
!define MUI_ABORTWARNING
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP_STRETCH AspectFitHeight
!define MUI_HEADERIMAGE_BITMAP "B:\Pictures\banner.bmp"
!define MUI_ICON "B:\Pictures\simmm.ico"
!define MUI_PAGE_HEADER_TEXT "TS2: UC - Starter Pack"
!define MUI_PAGE_HEADER_SUBTEXT "Packed by osab - Web Install v7"


!define MUI_WELCOMEPAGE_TITLE "osab's Sims 2 Starter Pack"
!define MUI_WELCOMEPAGE_TEXT "Welcome to the osab Starter Pack Web Installer (v7). Please ensure you have downloaded the latest version from GitHub. Helpful log messages will be shown in the 'More Details' box."

!define MUI_LICENSEPAGE_TEXT_TOP ""

!define MUI_FINISHPAGE_LINK_LOCATION "discord.gg/zzjHj2jxHV"
!define MUI_WELCOMEFINISHPAGE_BITMAP "B:\Pictures\orange.bmp"
!define MUI_FINISHPAGE_SHOWREADME "https://github.com/voicemxil/TS2-Starter-Pack/wiki/Step-III:-Graphics-Setup"
!define MUI_FINISHPAGE_SHOWREADME_NOTCHECKED
!define MUI_FINISHPAGE_SHOWREADME_TEXT "Open the next step of the guide"
!define MUI_FINISHPAGE_NOREBOOTSUPPORT
!define MUI_FINISHPAGE_LINK "Discord Server!"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "B:\Documents\GitHub\osab-TS2-web-installer\license.txt"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

Section "TS2 Starter Pack" Section1
	
	SectionIn RO 
	
	SetOutPath $INSTDIR

	InitPluginsDir
	
	AddSize 13600000
	
StrCpy $Installer "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_Installer-v7.exe"
StrCpy $AL "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_ApartmentLife-v7.exe"
StrCpy $BoB "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_BestofBusiness-v7.exe"
StrCpy $BV "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_BonVoyage-v7.exe"
StrCpy $Base "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_Base-v7.exe"
StrCpy $DD "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_DoubleDeluxe-v7.exe"
StrCpy $FT "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_FreeTime-v7.exe"
StrCpy $FwP "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_FunwithPets-v7.exe"
StrCpy $GLS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_GlamourLifeStuff-v7.exe"
StrCpy $SS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_Seasons-v7.exe"
StrCpy $UNI "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_UniversityLife-v7.exe"
	
inetc::get /POPUP "Downloading Installer..." "$Installer" "SFX_Installer-v7.exe"
	DetailPrint "Downloading __Installer from $Installer. Closing the download window will interrupt the download."
		Pop $0 # return value = exit code, "OK" means OK
			DetailPrint "__Installer download status: $0" 
	Exec '"SFX_Installer-v7.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'

inetc::get /POPUP "Downloading Apartment Life..." "$AL" "SFX_ApartmentLife-v7.exe"
	DetailPrint "Downloading Apartment Life from $AL. Closing the download window will interrupt the download."
		Pop $0 # return value = exit code, "OK" means OK
			DetailPrint "AL download status: $0" 

		Delete "SFX_Installer-v7.exe"
			DetailPrint "Deleted AutoExtract."

	Exec '"SFX_ApartmentLife-v7.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
inetc::get /POPUP "Downloading Best of Business..." "$BoB" "SFX_BestofBusiness-v7.exe"
	DetailPrint "Downloading Best of Business from $BoB. Closing the download window will interrupt the download."
		Pop $0 # return value = exit code, "OK" means OK
			DetailPrint "BoB download status: $0" 

		Delete "SFX_ApartmentLife-v7.exe"
			DetailPrint "Deleted AutoExtract."

	Exec '"SFX_BestofBusiness-v7.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
inetc::get /POPUP "Downloading Bon Voyage..." "$BV" "SFX_BonVoyage-v7.exe"
	DetailPrint "Downloading Bon Voyage from $BV. Closing the download window will interrupt the download."
		Pop $0 # return value = exit code, "OK" means OK
			DetailPrint "BV download status: $0" 

		Delete "SFX_BestofBusiness-v7.exe"
			DetailPrint "Deleted AutoExtract."

	Exec '"SFX_BonVoyage-v7.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
inetc::get /POPUP "Downloading Base Game..." "$Base" "SFX_Base-v7.exe"
	DetailPrint "Downloading Base Game from $Base. Closing the download window will interrupt the download."
		Pop $0 # return value = exit code, "OK" means OK
			DetailPrint "BG download status: $0" 

		Delete "SFX_BonVoyage-v7.exe"
			DetailPrint "Deleted AutoExtract."

	Exec '"SFX_Base-v7.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
inetc::get /POPUP "Downloading Double Deluxe (Packs)..." "$DD" "SFX_DoubleDeluxe-v7.exe"
	DetailPrint "Downloading Double Deluxe Packs from $DD. Closing the download window will interrupt the download."
		Pop $0 # return value = exit code, "OK" means OK
			DetailPrint "DD Packs download status: $0" 

		Delete "SFX_Base-v7.exe"
			DetailPrint "Deleted AutoExtract."

	Exec '"SFX_DoubleDeluxe-v7.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
inetc::get /POPUP "Downloading FreeTime..." "$FT" "SFX_FreeTime-v7.exe"
	DetailPrint "Downloading FreeTime from $FT. Closing the download window will interrupt the download."
		Pop $0 # return value = exit code, "OK" means OK
			DetailPrint "FT download status: $0" 

		Delete "SFX_DoubleDeluxe-v7.exe"
			DetailPrint "Deleted AutoExtract."

	Exec '"SFX_FreeTime-v7.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
inetc::get /POPUP "Downloading Fun with Pets..." "$FwP" "SFX_FunwithPets-v7.exe"
	DetailPrint "Downloading Fun with Pets from $FwP. Closing the download window will interrupt the download."
		Pop $0 # return value = exit code, "OK" means OK
			DetailPrint "FwP download status: $0" 

		Delete "SFX_FreeTime-v7.exe"
			DetailPrint "Deleted AutoExtract."

	Exec '"SFX_FunwithPets-v7.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
inetc::get /POPUP "Downloading Glamour Life Stuff..." "$GLS" "SFX_GlamourLifeStuff-v7.exe"
	DetailPrint "Downloading Glamour Life Stuff from $GLS. Closing the download window will interrupt the download."
		Pop $0 # return value = exit code, "OK" means OK
			DetailPrint "GLS download status: $0" 

		Delete "SFX_FunwithPets-v7.exe"
			DetailPrint "Deleted AutoExtract."

	Exec '"SFX_GlamourLifeStuff-v7.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
inetc::get /POPUP "Downloading Seasons..." "$SS" "SFX_Seasons-v7.exe"
	DetailPrint "Downloading Seasons from $SS. Closing the download window will interrupt the download."
		Pop $0 # return value = exit code, "OK" means OK
			DetailPrint "SS download status: $0" 

		Delete "SFX_GlamourLifeStuff-v7.exe"
			DetailPrint "Deleted AutoExtract."

	Exec '"SFX_Seasons-v7.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
inetc::get /POPUP "Downloading University..." "$UNI" "SFX_UniversityLife-v7.exe"
	DetailPrint "Downloading University from $UNI. Closing the download window will interrupt the download."
		Pop $0 # return value = exit code, "OK" means OK
			DetailPrint "UNI download status: $0" 

		Delete "SFX_Seasons-v7.exe"
			DetailPrint "Deleted AutoExtract."

	Execwait '"SFX_UniversityLife-v7.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'

		Delete "SFX_UniversityLife-v7.exe"
			DetailPrint "Deleted AutoExtract."


DetailPrint "Touching Up..."
Execwait '"$INSTDIR\__Installer\Touchup.exe" install -locale en_US -installPath "$INSTDIR" -autologging'

!include x64.nsh
${If} ${RunningX64}
	inetc::get /BANNER "Downloading GRM Setup (64-bit detected)..." "https://www.simsnetwork.com/files/graphicsrulesmaker/graphicsrulesmaker-2.0.0-64bit.exe" graphicsrulesmaker-2.0.0-64bit.exe
		Pop $0 # return value = exit code, "OK" means OK
		DetailPrint "GRM download status: $0. Executing installer..." 
	Execwait "graphicsrulesmaker-2.0.0-64bit.exe"
		DetailPrint "Cleaning up GRM installer..."
		Delete "graphicsrulesmaker-2.0.0-64bit.exe"
${Else}
	inetc::get /BANNER "Downloading GRM Setup (32-bit detected)..." "https://www.simsnetwork.com/files/graphicsrulesmaker/graphicsrulesmaker-2.0.0-32bit.exe" graphicsrulesmaker-2.0.0-32bit.exe
		Pop $0 # return value = exit code, "OK" means OK
		DetailPrint "GRM download status: $0. Executing installer..." 
	Execwait "graphicsrulesmaker-2.0.0-32bit.exe"
		DetailPrint "Cleaning up GRM installer..."
		Delete "graphicsrulesmaker-2.0.0-32bit.exe"
${EndIf}
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

Section /o "DXVK - REQUIRES VULKAN SUPPORT. Run Vulkan-Test." Section2
DetailPrint "Downloading DXVK $DXVKVER..."
inetc::get /BANNER "Downloading DXVK..." "https://github.com/doitsujin/dxvk/releases/download/v7.10.1/dxvk-1.10.1.tar.gz" "$INSTDIR\dxvk.tar.gz"
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "DXVK download status: $0. Extracting..." 

untgz::extract -h -u -d $INSTDIR -zgz "$INSTDIR\dxvk.tar.gz"
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "DXVK extraction status: $0. Deleting archive..." 
#Delete archive.
Delete "$INSTDIR\dxvk.tar.gz"
DetailPrint "Placing x32 d3d9.dll in TSBin..."
Rename "$INSTDIR\dxvk-$DXVKVER\x32\d3d9.dll" "$INSTDIR\Fun with Pets\SP9\TSBin\d3d9.dll"
DetailPrint "Done."
#Delete DXVK folder
DetailPrint "Deleting temporary DXVK folder."
RMDir /r $INSTDIR\dxvk-1.10.1
DetailPrint "Done."
SectionEnd

Section "Sim Shadow Fix" Section3
 ExecShell "open" "https://simnopke.tumblr.com/post/136184612377/sim-shadow-fix" SW_SHOWNORMAL
SectionEnd

Section "Start Menu Shortcut" Section4
	SetShellVarContext current
	CreateDirectory '$SMPROGRAMS\The Sims 2 Starter Pack\'
	CreateShortCut '$SMPROGRAMS\The Sims 2 Starter Pack\Launch Sims2RPC.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' 0
SectionEnd


LangString DESC_Section1 ${LANG_ENGLISH} "Installs TS2:UC, Sims2RPC, and Graphics Rules Maker."
LangString DESC_Section2 ${LANG_ENGLISH} "Installs DXVK $DXVKVER."
LangString DESC_Section3 ${LANG_ENGLISH} "Links you to SimNopke's Shadow Fix. Please install to your 'Documents\EA Games\The Sims 2 Ultimate Collection\Downloads' folder. DXVK/Intel users choose Not Misty version."
LangString DESC_Section4 ${LANG_ENGLISH} "Create a shortuct to launch the game in your Start menu."

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${Section1} $(DESC_Section1)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section2} $(DESC_Section2)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section3} $(DESC_Section3)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section4} $(DESC_Section4)


!insertmacro MUI_FUNCTION_DESCRIPTION_END
