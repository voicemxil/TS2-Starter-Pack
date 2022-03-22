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
Page directory 
Page instfiles 

Section TS2_Starter_Pack
	
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
	Exec '"$INSTDIR\Touchup.exe" install -locale en_US -installPath "$INSTDIR" -autologging'
	SectionEnd
