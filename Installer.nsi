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
# Regkey for reinstalling purposes
InstallDirRegKey HKLM "Software\WOW6432Node\EA GAMES\The Sims 2" "InstallDir" 

Function StoreDXVKVersion
	StrCpy $DXVKVER "1.10"
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
!define MUI_PAGE_HEADER_SUBTEXT "Packed by osab - Web Install v1.1.5"


!define MUI_WELCOMEPAGE_TITLE "osab's Sims 2 Starter Pack"
!define MUI_WELCOMEPAGE_TEXT "Welcome to the osab Starter Pack Web Installer (v1.1.5). Please ensure you have downloaded the latest version from GitHub. DO NOT CLICK THE X if you see a progress bar, or you will interrupt the download!"

!define MUI_LICENSEPAGE_TEXT_TOP "Please ensure you have read and agreed to the attached license terms before proceeding:"

!define MUI_FINISHPAGE_LINK_LOCATION "https://docs.google.com/document/d/1UT0HX3cO4xLft2KozGypU_N7ZcGQVr-54QD9asFsx5U/edit#"
!define MUI_WELCOMEFINISHPAGE_BITMAP "C:\Users\user\Pictures\Untitled.bmp"
!define MUI_FINISHPAGE_SHOWREADME https://github.com/voicemxil/osab-TS2-web-installer/blob/main/README.md
!define MUI_FINISHPAGE_RUN "$PROGRAMFILES\Graphics Rules Maker\bin\GraphicsRulesMakerUi.exe"
!define MUI_FINISHPAGE_RUN_TEXT "Graphics Rules Maker"

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

	AddSize 25000000
	
	InitPluginsDir
	
	SetOverwrite ifnewer
	
StrCpy $Installer "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract__Installer.exe"
StrCpy $AL "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract_ApartmentLife.exe"
StrCpy $BoB "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract_BestofBusiness.exe"
StrCpy $BV "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract_BonVoyage.exe"
StrCpy $DDBase "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/v1/AutoExtract_DoubleDeluxeBase.exe"
StrCpy $DD "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract_DoubleDeluxe.exe"
StrCpy $FT "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract_FreeTime.exe"
StrCpy $FwP "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract_FunwithPets.exe"
StrCpy $GLS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract_GlamourLifeStuff.exe"
StrCpy $SS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract_Seasons.exe"
StrCpy $UNI "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v1/AutoExtract_UniversityLife.exe"
	
inetc::get /BANNER "Downloading __Installer..." "$Installer" "AutoExtract__Installer.exe"
	Pop $0 # return value = exit code, "OK" means OK
	Exec '"AutoExtract__Installer.exe" -y -gm2 -InstallPath=".\" -o".\"'
inetc::get /BANNER "Downloading Apartment Life..." "$AL" "AutoExtract_ApartmentLife.exe"
	Pop $1 # return value = exit code, "OK" means OK
	Exec '"AutoExtract_ApartmentLife.exe" -y -gm2 -InstallPath=".\" -o".\"'
inetc::get /BANNER "Downloading Best of Business..." "$BoB" "AutoExtract_BestofBusiness.exe"
	Pop $2 # return value = exit code, "OK" means OK
	Exec '"AutoExtract_BestofBusiness.exe" -y -gm2 -InstallPath=".\" -o".\"'
inetc::get /BANNER "Downloading Bon Voyage..." "$BV" "AutoExtract_BonVoyage.exe"
	Pop $3 # return value = exit code, "OK" means OK
	Exec '"AutoExtract_BonVoyage.exe" -y -gm2 -InstallPath=".\" -o".\"'
inetc::get /BANNER "Downloading Double Deluxe Base..." "$DDBase" "AutoExtract_DoubleDeluxeBase.exe"
	Pop $4 # return value = exit code, "OK" means OK
	Exec '"AutoExtract_DoubleDeluxeBase.exe" -y -gm2 -InstallPath=".\" -o".\"'
inetc::get /BANNER "Downloading Double Deluxe (Packs)..." "$DD" "AutoExtract_DoubleDeluxe.exe"
	Pop $5 # return value = exit code, "OK" means OK
	Exec '"AutoExtract_DoubleDeluxe.exe" -y -gm2 -InstallPath=".\" -o".\"'
inetc::get /BANNER "Downloading FreeTime..." "$FT" "AutoExtract_FreeTime.exe"
	Pop $6 # return value = exit code, "OK" means OK
	Exec '"AutoExtract_FreeTime.exe" -y -gm2 -InstallPath=".\" -o".\"'
inetc::get /BANNER "Downloading Fun with Pets..." "$FwP" "AutoExtract_FunwithPets.exe"
	Pop $7 # return value = exit code, "OK" means OK
	Exec '"AutoExtract_FunwithPets.exe" -y -gm2 -InstallPath=".\" -o".\"'
inetc::get /BANNER "Downloading Glamour Life Stuff..." "$GLS" "AutoExtract_GlamourLifeStuff.exe"
	Pop $8 # return value = exit code, "OK" means OK
	Exec '"AutoExtract_GlamourLifeStuff.exe" -y -gm2 -InstallPath=".\" -o".\"'
inetc::get /BANNER "Downloading Seasons..." "$SS" "AutoExtract_Seasons.exe"
	Pop $9 # return value = exit code, "OK" means OK
	Exec '"AutoExtract_Seasons.exe" -y -gm2 -InstallPath=".\" -o".\"'
inetc::get /BANNER "Downloading University..." "$UNI" "AutoExtract_UniversityLife.exe"
	Pop $R0 # return value = exit code, "OK" means OK
	Execwait '"AutoExtract_UniversityLife.exe" -y -gm2 -InstallPath=".\" -o".\"'
	
	MessageBox MB_OK "Download Status: $0 $1 $2 $3 $4 $5 $6 $7 $8 $9 $R0"	
	
MessageBox MB_OK "Touching Up..."
Execwait '"$INSTDIR\Touchup.exe" install -locale en_US -installPath "$INSTDIR" -autologging'

!include x64.nsh
${If} ${RunningX64}
	inetc::get /BANNER "Downloading GRM Setup..." "https://www.simsnetwork.com/files/graphicsrulesmaker/graphicsrulesmaker-2.0.0-64bit.exe" graphicsrulesmaker-2.0.0-64bit.exe
		Pop $2 # return value = exit code, "OK" means OK
	    	MessageBox MB_OK "Download Status: $2"
	Execwait "graphicsrulesmaker-2.0.0-64bit.exe"
		Delete "graphicsrulesmaker-2.0.0-64bit.exe"
${Else}
	inetc::get /BANNER "Downloading GRM Setup..." "https://www.simsnetwork.com/files/graphicsrulesmaker/graphicsrulesmaker-2.0.0-32bit.exe" graphicsrulesmaker-2.0.0-32bit.exe
		Pop $3 # return value = exit code, "OK" means OK
	    	MessageBox MB_OK "Download Status: $3"
	Execwait "graphicsrulesmaker-2.0.0-32bit.exe"
		Delete "graphicsrulesmaker-2.0.0-32bit.exe"
${EndIf}
	
Delete "AutoExtract__Installer.exe"
Delete "AutoExtract_ApartmentLife.exe"
Delete "AutoExtract_BestofBusiness.exe"
Delete "AutoExtract_BonVoyage.exe"
Delete "AutoExtract_DoubleDeluxeBase.exe"
Delete "AutoExtract_DoubleDeluxe.exe"
Delete "AutoExtract_FreeTime.exe"
Delete "AutoExtract_FunWithPets.exe"
Delete "AutoExtract_GlamourLifeStuff.exe"
Delete "AutoExtract_Seasons.exe"
Delete "AutoExtract_UniversityLife.exe"

MessageBox MB_OK "Updating Sims2RPC."
Execwait '"$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPCUpdater.exe"'
SectionEnd


Section "DXVK - REQUIRES VULKAN SUPPORT. Run Vulkan-Test." Section2

inetc::get /BANNER "Downloading DXVK..." "https://github.com/doitsujin/dxvk/releases/download/v1.10/dxvk-1.10.tar.gz" "$INSTDIR\dxvk-1.10.tar.gz"
Pop $4 # return value = exit code, "OK" means OK
MessageBox MB_OK "DXVK Download Status: $4"

untgz::extract -h -u -d $INSTDIR -zgz "$INSTDIR\dxvk-1.10.tar.gz"
Pop $5 # return value = exit code, "OK" means OK
MessageBox MB_OK "DXVK Extraction Status: $5"
#Delete archive.
Delete "$INSTDIR\dxvk-1.10.tar.gz"

Rename "$INSTDIR\dxvk-$DXVKVER\x32\d3d9.dll" "$INSTDIR\Fun with Pets\SP9\TSBin\d3d9.dll"
#Delete DXVK folder
RMDir "$INSTDIR\dxvk-$DXVKVER"
SectionEnd

LangString DESC_Section1 ${LANG_ENGLISH} "Installs TS2:UC, Sims2RPC, and Graphics Rules Maker."
LangString DESC_Section2 ${LANG_ENGLISH} "Installs DXVK $DXVKVER."

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${Section1} $(DESC_Section1)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section2} $(DESC_Section2)
!insertmacro MUI_FUNCTION_DESCRIPTION_END
