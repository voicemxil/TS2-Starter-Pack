!include "MUI2.nsh"
Icon "C:\Program Files (x86)\NSIS\Contrib\Graphics\Icons\modern-install.ico"
var Installer
var AL
var BoB
var BV
var DD
var FT
var FwP
var GLS
var SS
var UNI

StrCpy $Installer "https://www.googleapis.com/drive/v3/files/1O4AX9szeOkRf1riEhexMPRIVgB7cdKmI?alt=media&key=AIzaSyB6xawrCnxzBORJWcZTrZ5EEazml2SlWLE"

StrCpy $AL "https://www.googleapis.com/drive/v3/files/1TYoWn4CatgeV1o7a26p0VMafoGQ7nnIF?alt=media&key=AIzaSyB6xawrCnxzBORJWcZTrZ5EEazml2SlWLE"

StrCpy $BoB

StrCpy $BV "https://www.googleapis.com/drive/v3/files/1MK1Rvftf7ITZK5u7tYxxvi3uoagwGrwG?alt=media&key=AIzaSyB6xawrCnxzBORJWcZTrZ5EEazml2SlWLE"

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

Function .OnInit
	Dialer::AttemptConnect
; plug-in auto-recognizes 'no parent dlg' in onInit and works accordingly
;    inetc::head /RESUME "Network error. Retry?" "http://ineum.narod.ru/spr_2003.htm" "$EXEDIR\spr3.txt"
;    Pop $4
FunctionEnd

###########################
!define MUI_ABORTWARNING
!define MUI_PAGE_HEADER_TEXT "TS2: UC - Starter Pack"
!define MUI_PAGE_HEADER_SUBTEXT "Packed by osab - Web Install"
!define MUI_LICENSEPAGE_TEXT_TOP "Please ensure you have read and agreed to the attached license terms before proceeding:"
!define MUI_WELCOMEPAGE_TITLE "osab's Sims 2 Starter Pack"
!define MUI_WELCOMEPAGE_TEXT "Welcome to the osab Starter Pack Web Installer."
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


Section "TS2 Starter Pack"
	
	SectionIn RO 
	
	SetOutPath $INSTDIR

	AddSize 25000000
	
	InitPluginsDir
	
	SetOverwrite ifnewer
	
inetc::get /BANNER "Downloading __Installer..." "" "AutoExtract__Installer.exe"
	Pop $0 # return value = exit code, "OK" means OK
	MessageBox MB_OK "Installer Download Status: $0"
	Exec '"AutoExtract__Installer.exe" -y -o ".\"'
inetc::get /BANNER "Downloading Apartment Life..." "" "AutoExtract__Apartment Life.exe"
	Pop $1 # return value = exit code, "OK" means OK
	MessageBox MB_OK "AL Download Status: $1"
	Exec '"AutoExtract_Apartment Life.exe" -y -o ".\"'
inetc::get /BANNER "Downloading Best of Business..." "" "AutoExtract_Best of Business.exe"
	Pop $2 # return value = exit code, "OK" means OK
	MessageBox MB_OK "BoB Download Status: $2"
	Exec '"AutoExtract_Best of Business.exe" -y -o ".\"'
inetc::get /BANNER "Downloading Bon Voyage..." "" "AutoExtract_Bon Voyage.exe"
	Pop $3 # return value = exit code, "OK" means OK
	MessageBox MB_OK "BV Download Status: $3"
	Exec '"AutoExtract_Bon Voyage.exe" -y -o ".\"'
inetc::get /BANNER "Downloading Double Deluxe..." "" "AutoExtract_Double Deluxe.exe"
	Pop $4 # return value = exit code, "OK" means OK
	MessageBox MB_OK "DD Download Status: $4"
	Exec '"AutoExtract_Double Deluxe.exe" -y -o ".\"'
inetc::get /BANNER "Downloading FreeTime..." "" "AutoExtract_FreeTime.exe"
	Pop $5 # return value = exit code, "OK" means OK
	MessageBox MB_OK "FT Download Status: $5"
	Exec '"AutoExtract_FreeTime.exe" -y -o ".\"'
inetc::get /BANNER "Downloading Fun with Pets..." "" "AutoExtract_Fun with Pets.exe"
	Pop $6 # return value = exit code, "OK" means OK
	MessageBox MB_OK "FwP Download Status: $6"
	Exec '"AutoExtract_Fun with Pets.exe" -y -o ".\"'
inetc::get /BANNER "Downloading Glamour Life Stuff..." "" "AutoExtract_Glamour Life Stuff.exe"
	Pop $7 # return value = exit code, "OK" means OK
	MessageBox MB_OK "GLS Download Status: $7"
	Exec '"AutoExtract_Glamour Life Stuff.exe" -y -o ".\"'
inetc::get /BANNER "Downloading Seasons..." "" "AutoExtract_Seasons.exe"
	Pop $8 # return value = exit code, "OK" means OK
	MessageBox MB_OK "SS Download Status: $8"
	Exec '"AutoExtract_Seasons.exe" -y -o ".\"'
inetc::get /BANNER "Downloading University..." "" "AutoExtract_University Life.exe"
	Pop $9 # return value = exit code, "OK" means OK
	MessageBox MB_OK "U Download Status: $9"
	Execwait '"AutoExtract_University Life.exe" -y -o ".\"'
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
Delete "AutoExtract__Apartment Life.exe"
Delete "AutoExtract__Best of Business.exe"
Delete "AutoExtract__Bon Voyage.exe"
Delete "AutoExtract__Double Deluxe.exe"
Delete "AutoExtract__FreeTime.exe"
Delete "AutoExtract__Fun with Pets.exe"
Delete "AutoExtract__Glamour Life Stuff.exe"
Delete "AutoExtract__Seasons.exe"
Delete "AutoExtract__University Life.exe"
SectionEnd


Section "DXVK - REQUIRES VULKAN SUPPORT. Run Vulkan-Test."

inetc::get /BANNER "Downloading DXVK..." "https://github.com/doitsujin/dxvk/releases/download/v1.10/dxvk-1.10.tar.gz" "$INSTDIR\dxvk-1.10.tar.gz"
Pop $4 # return value = exit code, "OK" means OK
MessageBox MB_OK "DXVK Download Status: $4"

untgz::extract -h -u -d $INSTDIR -zgz "$INSTDIR\dxvk-1.10.tar.gz"
Pop $5 # return value = exit code, "OK" means OK
MessageBox MB_OK "DXVK Extraction Status: $5"
#Delete archive.
Delete "$INSTDIR\dxvk-1.10.tar.gz"

Rename "$INSTDIR\dxvk-1.10\x32\d3d9.dll" "$INSTDIR\Fun with Pets\SP9\TSBin\d3d9.dll"
#Delete DXVK folder
RMDir "$INSTDIR\dxvk-1.10"
SectionEnd
