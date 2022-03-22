# Names the built installer
Name "The Sims 2 Starter Pack by osab"
# Building to:
OutFile "TS2 Starter Pack WebInstall (osab).exe"
# Administrator Privileges 
RequestExecutionLevel admin
# Default Installation Directory
InstallDir "$PROGRAMFILES32/The Sims 2 Starter Pack"
# Regkey for reinstalling purposes
InstallDirRegKey HKLM "Software\WOW6432Node\EA GAMES\The Sims 2" "InstallDir" 

Function connect
	Dialer::AttemptConnect
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

	Call connect
	
	inetc::get /BANNER "Downloading archive..." \ "https://download2347.mediafire.com/86cbr7or049g/ejbhtnu8itob4t0/osab_Sims+2+Starter+Pack.7z" \ "osab_Sims 2 Starter Pack.7z"
		NSIS7z::ExtractWithDetails "osab_Sims 2 Starter Pack.7z" "Extracting game archive %s..."
			Delete "osab_Sims 2 Starter Pack.7z"
		Exec '"$INSTDIR/Touchup.exe" install -locale en_US -installPath $INSTDIR -autologging'
	SectionEnd
	
