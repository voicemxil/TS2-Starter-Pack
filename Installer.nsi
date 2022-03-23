!include "MUI2.nsh"
Icon "C:\Program Files (x86)\NSIS\Contrib\Graphics\Icons\modern-install.ico"

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

Function dl
IfFileExists "$INSTDIR\osab_Sims 2 Starter Pack.7z" Exists
		inetc::get /BANNER "Downloading archive..." "https://download2347.mediafire.com/86cbr7or049g/ejbhtnu8itob4t0/osab_Sims+2+Starter+Pack.7z" "osab_Sims 2 Starter Pack.7z"
		Pop $0 # return value = exit code, "OK" means OK
	    MessageBox MB_OK "Download Status: $0"
    Exists:
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
	
Call dl

		NSIS7z::ExtractWithDetails "osab_Sims 2 Starter Pack.7z" "Extracting game archive %s..."
			 Pop $1 # return value = exit code, "OK" means OK
			 	    MessageBox MB_OK "Extraction Status: $1"
		##Delete "$INSTDIR\osab_Sims 2 Starter Pack.7z"
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
