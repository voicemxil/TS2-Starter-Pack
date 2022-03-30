!include "MUI2.nsh"
Icon "C:\Program Files (x86)\NSIS\Contrib\Graphics\Icons\modern-install.ico"
Var Installer
Var AL
Var BoB
Var BV
Var DDBase
Var DD
Var FT
Var FwP
Var GLS
Var SS
Var UNI
Var DXVKVER

# Names the built installer
Name "osab's Sims 2 Starter Pack"
# Building to:
OutFile "TS2 Starter Pack WebInstall.exe"
# Administrator Privileges 
RequestExecutionLevel admin
# Default Installation Directory
InstallDir "$PROGRAMFILES32\The Sims 2 Starter Pack"

Function StoreDXVKVersion
	StrCpy $DXVKVER "1.10.1"
FunctionEnd

Function .OnInit
	Dialer::AttemptConnect
; plug-in auto-recognizes 'no parent dlg' in onInit and works accordingly
;    inetc::head /RESUME "Network error. Retry?" "http://ineum.narod.ru/spr_2003.htm" "$EXEDIR\spr3.txt"
;    Pop $4
	Call StoreDXVKVersion
FunctionEnd



###########################
!define MUI_ABORTWARNING
!define MUI_PAGE_HEADER_TEXT "TS2: UC - Starter Pack"
!define MUI_PAGE_HEADER_SUBTEXT "Packed by osab - Web Install v4"


!define MUI_WELCOMEPAGE_TITLE "osab's Sims 2 Starter Pack"
!define MUI_WELCOMEPAGE_TEXT "Welcome to the osab Starter Pack Web Installer (v4). Please ensure you have downloaded the latest version from GitHub. DO NOT CLICK THE X if you see a progress bar, or you will interrupt the download!"

!define MUI_LICENSEPAGE_TEXT_TOP "Please ensure you have read and agreed to the attached license terms before proceeding:"

!define MUI_FINISHPAGE_LINK_LOCATION "https://docs.google.com/document/d/1UT0HX3cO4xLft2KozGypU_N7ZcGQVr-54QD9asFsx5U/edit#"
!define MUI_WELCOMEFINISHPAGE_BITMAP "C:\Users\user\Pictures\Untitled.bmp"
!define MUI_FINISHPAGE_SHOWREADME https://github.com/voicemxil/osab-TS2-web-installer/blob/main/README.md

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "C:\Users\user\Documents\GitHub\osab-TS2-web-installer\license.txt"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

Section "TS2 Starter Pack" Section1
	
	SectionIn RO 
	
	SetOutPath $INSTDIR

	InitPluginsDir
	
	SetOverwrite ifnewer
	
	AddSize 13600000
	
StrCpy $Installer "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract__Installer.exe"
StrCpy $AL "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract_ApartmentLife.exe"
StrCpy $BoB "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract_BestofBusiness.exe"
StrCpy $BV "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract_BonVoyage.exe"
StrCpy $DDBase "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract_DoubleDeluxeBase.exe"
StrCpy $DD "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract_DoubleDeluxe.exe"
StrCpy $FT "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract_FreeTime.exe"
StrCpy $FwP "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract_FunwithPets.exe"
StrCpy $GLS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract_GlamourLifeStuff.exe"
StrCpy $SS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract_Seasons.exe"
StrCpy $UNI "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract_UniversityLife.exe"
	
inetc::get /BANNER "Downloading __Installer..." "$Installer" "AutoExtract__Installer.exe"
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "$0" 
	Exec '"AutoExtract__Installer.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
inetc::get /BANNER "Downloading Apartment Life..." "$AL" "AutoExtract_ApartmentLife.exe"
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "$0" 
Delete "AutoExtract__Installer.exe"
	Exec '"AutoExtract_ApartmentLife.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
inetc::get /BANNER "Downloading Best of Business..." "$BoB" "AutoExtract_BestofBusiness.exe"
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "$0" 
Delete "AutoExtract_ApartmentLife.exe"
	Exec '"AutoExtract_BestofBusiness.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
inetc::get /BANNER "Downloading Bon Voyage..." "$BV" "AutoExtract_BonVoyage.exe"
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "$0" 
Delete "AutoExtract_BestofBusiness.exe"
	Exec '"AutoExtract_BonVoyage.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
inetc::get /BANNER "Downloading Double Deluxe (Base)..." "$DDBase" "AutoExtract_DoubleDeluxeBase.exe"
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "$0" 
Delete "AutoExtract_BonVoyage.exe"
	Exec '"AutoExtract_DoubleDeluxeBase.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
inetc::get /BANNER "Downloading Double Deluxe (Packs)..." "$DD" "AutoExtract_DoubleDeluxe.exe"
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "$0" 
Delete "AutoExtract_DoubleDeluxeBase.exe"
	Exec '"AutoExtract_DoubleDeluxe.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
inetc::get /BANNER "Downloading FreeTime..." "$FT" "AutoExtract_FreeTime.exe"
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "$0" 
Delete "AutoExtract_DoubleDeluxe.exe"
	Exec '"AutoExtract_FreeTime.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
inetc::get /BANNER "Downloading Fun with Pets..." "$FwP" "AutoExtract_FunwithPets.exe"
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "$0" 
Delete "AutoExtract_FreeTime.exe"
	Exec '"AutoExtract_FunwithPets.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
inetc::get /BANNER "Downloading Glamour Life Stuff..." "$GLS" "AutoExtract_GlamourLifeStuff.exe"
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "$0" 
Delete "AutoExtract_FunwithPets.exe"
	Exec '"AutoExtract_GlamourLifeStuff.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
inetc::get /BANNER "Downloading Seasons..." "$SS" "AutoExtract_Seasons.exe"
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "$0" 
Delete "AutoExtract_GlamourLifeStuff.exe"
	Exec '"AutoExtract_Seasons.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
inetc::get /BANNER "Downloading University..." "$UNI" "AutoExtract_UniversityLife.exe"
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "$0" 
Delete "AutoExtract_Seasons.exe"
	Execwait '"AutoExtract_UniversityLife.exe" -InstallPath=".\" -o".\" -y -gm1 -SelfDelete="1"'
Delete "AutoExtract_UniversityLife.exe"

MessageBox MB_OK "Touching Up..."
Execwait '"$INSTDIR\__Installer\Touchup.exe" install -locale en_US -installPath "$INSTDIR" -autologging'

!include x64.nsh
${If} ${RunningX64}
	inetc::get /BANNER "Downloading GRM Setup..." "https://www.simsnetwork.com/files/graphicsrulesmaker/graphicsrulesmaker-2.0.0-64bit.exe" graphicsrulesmaker-2.0.0-64bit.exe
		Pop $0 # return value = exit code, "OK" means OK
		DetailPrint "$0" 
	Execwait "graphicsrulesmaker-2.0.0-64bit.exe"
		Delete "graphicsrulesmaker-2.0.0-64bit.exe"
${Else}
	inetc::get /BANNER "Downloading GRM Setup..." "https://www.simsnetwork.com/files/graphicsrulesmaker/graphicsrulesmaker-2.0.0-32bit.exe" graphicsrulesmaker-2.0.0-32bit.exe
		Pop $0 # return value = exit code, "OK" means OK
		DetailPrint "$0" 
	Execwait "graphicsrulesmaker-2.0.0-32bit.exe"
		Delete "graphicsrulesmaker-2.0.0-32bit.exe"
${EndIf}

inetc::get /BANNER "Downloading Sims2RPC..." "https://cdn.simfileshare.net/download/2745478/?dl" "Sims2RPC Web Installer.zip"

nsisunz::UnzipToLog "Sims2RPC Web Installer.zip" "$INSTDIR"
Pop $0
DetailPrint "$0" ;print error message to log
Delete "Sims2RPC Web Installer.zip"
ExecWait '"Sims2RPCInstaller.exe"'
Delete "Sims2RPCInstaller.exe"
		
SectionEnd

Section "DXVK - REQUIRES VULKAN SUPPORT. Run Vulkan-Test." Section2

inetc::get /BANNER "Downloading DXVK..." "https://github.com/doitsujin/dxvk/releases/download/v1.10.1/dxvk-1.10.1.tar.gz" "$INSTDIR\dxvk.tar.gz"
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "$0" 

untgz::extract -h -u -d $INSTDIR -zgz "$INSTDIR\dxvk.tar.gz"
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "$0" 
#Delete archive.
Delete "$INSTDIR\dxvk.tar.gz"

Rename "$INSTDIR\dxvk-$DXVKVER\x32\d3d9.dll" "$INSTDIR\Fun with Pets\SP9\TSBin\d3d9.dll"
#Delete DXVK folder
RMDir /r $INSTDIR\dxvk-1.10.1
SectionEnd
	
Section "NoErrorVisualization by Lazy Duchess" Section3
inetc::get /Banner "Downloading NoErrorVisualization by Lazy Duchess" "https://cdn.simfileshare.net/download/2990151/?dl" "$INSTDIR/Fun with Pets/SP9/TSBin/mods"
SectionEnd

Section "Sim Shadow Fix" Section4
 ExecShell "open" "https://simnopke.tumblr.com/post/136184612377/sim-shadow-fix" SW_SHOWNORMAL
SectionEnd

	
LangString DESC_Section1 ${LANG_ENGLISH} "Installs TS2:UC, Sims2RPC, and Graphics Rules Maker."
LangString DESC_Section2 ${LANG_ENGLISH} "Installs DXVK $DXVKVER."
LangString DESC_Section3 ${LANG_ENGLISH} "Installs NoErrorVisualization by Lazy Duchess - makes your game immune to pink flashing issues."
LangString DESC_Section4 ${LANG_ENGLISH} "Links you to SimNopke's Shadow Fix. Please manually install to your 'Documents\EA Games\The Sims 2 Ultimate Collection\Downloads' folder."
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${Section1} $(DESC_Section1)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section2} $(DESC_Section2)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section3} $(DESC_Section3)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section4} $(DESC_Section4)
!insertmacro MUI_FUNCTION_DESCRIPTION_END
