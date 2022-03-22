# Names the built installer
	Name "The Sims 2 Starter Pack by osab"
		OutFile "TS2 Starter Pack WebInstall (osab).exe"
			RequestExecutionLevel admin
PageEx Directory
  	DirVar $INSTDIR
PageExEnd
Page InstFiles
Section DiskSetup
	AddSize 25000000
	InitPluginsDir
	SetOutPath -
	SetOverwrite ifnewer
SectionEnd
Section Network
	Dialer::AttemptConnect
SectionEnd
Section Download
	inetc::get /BANNER "Downloading archive..." \ "https://download2347.mediafire.com/86cbr7or049g/ejbhtnu8itob4t0/osab_Sims+2+Starter+Pack.7z" \ "osab_Sims 2 Starter Pack.7z"
		NSIS7z::ExtractWithDetails "osab_Sims 2 Starter Pack.7z" "Extracting game archive %s..."
			Delete "osab_Sims 2 Starter Pack.7z"
		Exec '"$INSTDIR/Touchup.exe" install -locale en_US -installPath $INSTDIR -autologging'
	SectionEnd
	