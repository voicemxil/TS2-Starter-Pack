# Names the built installer
	Name "The Sims 2 Starter Pack (Web installer by osab)"
		OutFile "TS2 Starter Pack WebInstall (osab).exe"
			RequestExecutionLevel admin
 
Section "Install"
	definstdir "$PROGRAMFILES32/The Sims 2 Starter Pack/" 
  		PageEx Directory
  			DirVar $INSTDIR
  		PageExEnd
SectionEnd
PageEx InstFiles
Section "Download" 
	InitPluginsDir
		SetOutPath $PLUGINSDIR
  			SetOverwrite ifnewer
  				NSISdl::download "https://download2347.mediafire.com/86cbr7or049g/ejbhtnu8itob4t0/osab_Sims+2+Starter+Pack.7z" "osab_Sims 2 Starter Pack.7z"; 
SectionEnd

Section "Extract"
	SetOutPath -
		ReserveFile $PLUGINSDIR/osab_Sims 2 Starter Pack.7z
			Nsis7z::ExtractWithDetails "osab_Sims 2 Starter Pack.7z" "Extracting game archive %s..."
				Delete "$PLUGINSDIR\osab_Sims 2 Starter Pack.7z"
SectionEnd

Section "Touchup"
	SetOutPath $INSTDIR/__Installer/
		ReserveFile Touchup.exe
			Exec '"Touchup.exe" install -locale en_US -installPath $INSTDIR -autologging'
SectionEnd

PageExEnd
