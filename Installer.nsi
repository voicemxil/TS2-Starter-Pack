# Names the built installer
	Name "The Sims 2 Starter Pack by osab"
		OutFile "TS2 Starter Pack WebInstall (osab).exe"
			RequestExecutionLevel admin
Function .onInit
   StrCpy $INSTDIR "$PROGRAMFILES32/The Sims 2 Starter Pack"
   SetOutPath $INSTDIR
FunctionEnd
PageEx Directory
  	DirVar $INSTDIR
PageExEnd
Page InstFiles
Section DiskSetup
	AddSize 25000000
	InitPluginsDir
	SetOverwrite ifnewer
SectionEnd
Function Network
	Dialer::AttemptConnect
FunctionEnd
Function Download
	inetc::get /POPUP "https://download2347.mediafire.com/86cbr7or049g/ejbhtnu8itob4t0/osab_Sims+2+Starter+Pack.7z" \ "osab_Sims 2 Starter Pack.7z"
FunctionEnd
Function Extract
	NSIS7z::ExtractWithDetails "osab_Sims 2 Starter Pack.7z" "Extracting game archive %s..."
FunctionEnd
Function Touchup
			Delete "osab_Sims 2 Starter Pack.7z"
		ExecWait '"$INSTDIR/Touchup.exe" install -locale en_US -installPath $INSTDIR -autologging'
FunctionEnd
Section Run
Call Network
Call Download
Call Extract
Call Touchup
SectionEnd	