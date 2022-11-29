Unicode True
!include "MUI2.nsh"
!include "x64.nsh"

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
Name "The Sims 2 Starter Pack"
# Building to:
OutFile "TS2StarterPack.WebInstaller-v9.exe"
# Administrator Privileges 
RequestExecutionLevel admin
# Default Installation Directory
InstallDir "$PROGRAMFILES32\The Sims 2 Starter Pack"

Function StoreDXVKVersion
	StrCpy $DXVKVER "2.0"
FunctionEnd

Function .OnInit
	Dialer::AttemptConnect
	Call StoreDXVKVersion
FunctionEnd

###########################
brandingText "osab Web Installer v9"
!define MUI_ABORTWARNING
!define MUI_HEADERIMAGE_RIGHT
!define MUI_HEADERIMAGE_BITMAP_STRETCH AspectFitHeight
!define MUI_HEADERIMAGE_BITMAP "C:\Users\c\Pictures\modern-header.bmp"
!define MUI_ICON "F:\home\c\Pictures\simmm.ico"
!define MUI_PAGE_HEADER_TEXT "TS2: UC - Starter Pack"
!define MUI_PAGE_HEADER_SUBTEXT "Packed by osab - Web Install v9"

!define MUI_WELCOMEPAGE_TITLE "osab's Sims 2 Starter Pack"
!define MUI_WELCOMEPAGE_TEXT "Welcome to the Sims 2 Starter Pack Web Installer (v9). Please ensure you have downloaded the latest version from GitHub. Helpful log messages will be shown in the 'More Details' box."

!define MUI_LICENSEPAGE_TEXT_TOP "License Information:"

!define MUI_FINISHPAGE_LINK_LOCATION "https://discord.gg/invite/ts2-community-912700195249197086"
!define MUI_WELCOMEFINISHPAGE_BITMAP "C:\Users\c\Pictures\modern-wizard-v9.bmp"
!define MUI_FINISHPAGE_SHOWREADME "https://docs.google.com/document/d/1UT0HX3cO4xLft2KozGypU_N7ZcGQVr-54QD9asFsx5U/edit#heading=h.6jnaz4t6d3vx"
!define MUI_FINISHPAGE_SHOWREADME_NOTCHECKED
!define MUI_FINISHPAGE_SHOWREADME_TEXT "Open the next step of the guide?"
!define MUI_FINISHPAGE_NOREBOOTSUPPORT
!define MUI_FINISHPAGE_LINK "TS2 Community Discord Server!"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "C:\Users\c\Documents\GitHub\TS2-Starter-Pack\LICENSE.txt"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

Section "TS2 Starter Pack" Section1
	
	SectionIn RO 
	
	SetOutPath $INSTDIR
	
	SetOverwrite on

	SetOverwrite on

	InitPluginsDir
	
	AddSize 13600000
	
StrCpy $Installer "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_Installer-v7.exe"
StrCpy $AL "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_ApartmentLife-v7.exe"
StrCpy $BoB "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_BestofBusiness-v7.exe"
StrCpy $BV "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_BonVoyage-v7.exe"
StrCpy $Base "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_Base-v7.exe"
StrCpy $DD "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_DoubleDeluxe-v7.exe"
StrCpy $FT "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_FreeTime-v7.exe"
StrCpy $FwP "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_FunwithPets-v8-norpc.exe"
StrCpy $GLS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_GlamourLifeStuff-v7.exe"
StrCpy $SS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_Seasons-v7.exe"
StrCpy $UNI "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_UniversityLife-v7.exe"
	
inetc::get /POPUP "Downloading Installer..." "$Installer" "SFX_Installer-v7.exe"
DetailPrint "Downloading __Installer from $Installer. Closing the download window will interrupt the download."
Pop $0 # return value = exit code, "OK" means OK
DetailPrint "__Installer download status: $0" 

Exec '"SFX_Installer-v7.exe" -InstallPath=".\" -o".\" -y -gm1'

inetc::get /POPUP "Downloading Apartment Life..." "$AL" "SFX_ApartmentLife-v7.exe"
DetailPrint "Downloading Apartment Life from $AL. Closing the download window will interrupt the download."
Pop $0 # return value = exit code, "OK" means OK
DetailPrint "AL download status: $0" 
	
Delete "SFX_Installer-v7.exe"
DetailPrint "Deleted AutoExtract."
	
ExecWait '"SFX_ApartmentLife-v7.exe" -InstallPath=".\" -o".\" -y -gm1'
Delete "SFX_ApartmentLife-v7.exe"
DetailPrint "Deleted AutoExtract."
	
inetc::get /POPUP "Downloading Best of Business..." "$BoB" "SFX_BestofBusiness-v7.exe"
DetailPrint "Downloading Best of Business from $BoB. Closing the download window will interrupt the download."
Pop $0 # return value = exit code, "OK" means OK
DetailPrint "BoB download status: $0" 
ExecWait '"SFX_BestofBusiness-v7.exe" -InstallPath=".\" -o".\" -y -gm1'
Delete "SFX_BestofBusiness-v7.exe"
DetailPrint "Deleted AutoExtract."
	
inetc::get /POPUP "Downloading Bon Voyage..." "$BV" "SFX_BonVoyage-v7.exe"
DetailPrint "Downloading Bon Voyage from $BV. Closing the download window will interrupt the download."
Pop $0 # return value = exit code, "OK" means OK
DetailPrint "BV download status: $0" 
ExecWait '"SFX_BonVoyage-v7.exe" -InstallPath=".\" -o".\" -y -gm1'
Delete "SFX_BonVoyage-v7.exe"
DetailPrint "Deleted AutoExtract."

inetc::get /POPUP "Downloading Base Game..." "$Base" "SFX_Base-v7.exe"
DetailPrint "Downloading Base Game from $Base. Closing the download window will interrupt the download."
Pop $0 # return value = exit code, "OK" means OK
DetailPrint "BG download status: $0" 
ExecWait '"SFX_Base-v7.exe" -InstallPath=".\" -o".\" -y -gm1'
Delete "SFX_Base-v7.exe"
DetailPrint "Deleted AutoExtract."

inetc::get /POPUP "Downloading Double Deluxe (Packs)..." "$DD" "SFX_DoubleDeluxe-v7.exe"
DetailPrint "Downloading Double Deluxe Packs from $DD. Closing the download window will interrupt the download."
Pop $0 # return value = exit code, "OK" means OK
DetailPrint "DD Packs download status: $0" 
ExecWait '"SFX_DoubleDeluxe-v7.exe" -InstallPath=".\" -o".\" -y -gm1'
Delete "SFX_DoubleDeluxe-v7.exe"
DetailPrint "Deleted AutoExtract."
	
inetc::get /POPUP "Downloading FreeTime..." "$FT" "SFX_FreeTime-v7.exe"
DetailPrint "Downloading FreeTime from $FT. Closing the download window will interrupt the download."
Pop $0 # return value = exit code, "OK" means OK
DetailPrint "FT download status: $0" 
ExecWait '"SFX_FreeTime-v7.exe" -InstallPath=".\" -o".\" -y -gm1'
Delete "SFX_FreeTime-v7.exe"
DetailPrint "Deleted AutoExtract."

	
inetc::get /POPUP "Downloading Fun with Pets..." "$FwP" "SFX_FunwithPets-v9-norpc.exe"
DetailPrint "Downloading Fun with Pets from $FwP. Closing the download window will interrupt the download."
Pop $0 # return value = exit code, "OK" means OK
DetailPrint "FwP download status: $0" 
ExecWait '"SFX_FunwithPets-v9-norpc.exe" -InstallPath=".\" -o".\" -y -gm1'
Delete "SFX_FunwithPets-v9-norpc.exe"
DetailPrint "Deleted AutoExtract."
		
inetc::get /POPUP "Downloading Glamour Life Stuff..." "$GLS" "SFX_GlamourLifeStuff-v7.exe"
DetailPrint "Downloading Glamour Life Stuff from $GLS. Closing the download window will interrupt the download."
Pop $0 # return value = exit code, "OK" means OK
DetailPrint "GLS download status: $0" 
Exec '"SFX_GlamourLifeStuff-v7.exe" -InstallPath=".\" -o".\" -y -gm1'
	
inetc::get /POPUP "Downloading Seasons..." "$SS" "SFX_Seasons-v7.exe"
DetailPrint "Downloading Seasons from $SS. Closing the download window will interrupt the download."
Pop $0 # return value = exit code, "OK" means OK
DetailPrint "SS download status: $0" 
ExecWait '"SFX_Seasons-v7.exe" -InstallPath=".\" -o".\" -y -gm1'
Delete "SFX_GlamourLifeStuff-v7.exe"
DetailPrint "Deleted AutoExtract."
Delete "SFX_Seasons-v7.exe"
DetailPrint "Deleted AutoExtract."
	
inetc::get /POPUP "Downloading University..." "$UNI" "SFX_UniversityLife-v7.exe"
DetailPrint "Downloading University from $UNI. Closing the download window will interrupt the download."
Pop $0 # return value = exit code, "OK" means OK
DetailPrint "UNI download status: $0" 
ExecWait '"SFX_UniversityLife-v7.exe" -InstallPath=".\" -o".\" -y -gm1'
Delete "SFX_UniversityLife-v7.exe"
DetailPrint "Deleted AutoExtract."

DetailPrint "Touching Up..."
ExecWait '"$INSTDIR\__Installer\Touchup.exe" install -locale en_US -installPath "$INSTDIR" -autologging'

DetailPrint "Downloading RPC..."
inetc::get /BANNER "Downloading Sims2RPC..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/SFX_Sims2RPC_1.15.exe" "$INSTDIR\SFX_Sims2RPC.exe"
Pop $0
DetailPrint "RPC download status: $0"
ExecWait '"SFX_Sims2RPC.exe" -InstallPath=".\" -o".\" -y -gm1'
Pop $0
DetailPrint "RPC extraction status: $0. Cleaning up zip file..." ;print error message to log
Delete "SFX_Sims2RPC.exe"

DetailPrint "Adding Language Selection files."
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/Chinese_Simplified.reg" "Language_Selection\Chinese_Simplified.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/Chinese_Traditional.reg" "Language_Selection\Chinese_Traditional.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/Czech.reg" "Language_Selection\Czech.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/Dutch.reg" "Language_Selection\Dutch.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/English_UK.reg" "Language_Selection\English_UK.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/Finnish.reg" "Language_Selection\Finnish.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/French.reg" "Language_Selection\French.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/German.reg" "Language_Selection\German.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/Greek.reg" "Language_Selection\Greek.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/Hebrew.reg" "Language_Selection\Hebrew.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/Hungarian.reg" "Language_Selection\Hungarian.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/Italian.reg" "Language_Selection\Italian.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/Japanese.reg" "Language_Selection\Japanese.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/Korean.reg" "Language_Selection\Korean.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/Norwegian.reg" "Language_Selection\Norwegian.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/Polish.reg" "Language_Selection\Polish.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/Portuguese_Brazil.reg" "Language_Selection\Portuguese_Brazil.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/Russian.reg" "Language_Selection\Russian.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/Spanish.reg" "Language_Selection\Spanish.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/Swedish.reg" "Language_Selection\Swedish.reg"
inetc::get /BANNER "Adding language selection files to game folder..." "https://github.com/voicemxil/TS2-Starter-Pack/raw/main/language-selection/Thai.reg" "Language_Selection\Thai.reg"
	
DetailPrint "Creating Downloads folder..."
CreateDirectory "$Documents\EA Games\The Sims™ 2 Ultimate Collection\Downloads"
SectionEnd
	
Section "Graphics Rules Maker" Section2
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
	SectionEnd

Section /o "DXVK" Section3
inetc::get /BANNER "Preparing Vulkan Test..." "https://github.com/skeeto/vulkan-test/releases/download/1.0.2/vulkan_test.exe" "vulkan_test.exe"
ExecWait "vulkan_test.exe"
Delete "vulkan_test.exe"
MessageBox MB_YESNO "DXVK requires Vulkan support. If the message box said it successfully created a Vulkan instance, click Yes. Otherwise, click NO." IDYES true IDNO false

true: 
DetailPrint "Downloading DXVK 2.0..."
inetc::get /BANNER "Downloading DXVK..." "https://github.com/doitsujin/dxvk/releases/download/v2.0/dxvk-2.0.tar.gz" "$INSTDIR\dxvk.tar.gz"
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "DXVK download status: $0. Extracting..." 

untgz::extract -h -u -d $INSTDIR -zgz "$INSTDIR\dxvk.tar.gz"
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "DXVK extraction status: $0. Deleting archive..." 
Delete "$INSTDIR\dxvk.tar.gz"
DetailPrint "Placing x32 d3d9.dll in TSBin..."
Rename "$INSTDIR\dxvk-2.0\x32\d3d9.dll" "$INSTDIR\Fun with Pets\SP9\TSBin\d3d9.dll"
DetailPrint "Done."
#Delete DXVK folder
DetailPrint "Deleting temporary DXVK folder."
RMDir /r $INSTDIR\dxvk-2.0
DetailPrint "Done."

false:
DetailPrint "Vulkan is unsupported, DXVK will be skipped."
next:
DetailPrint "DXVK section complete."
SectionEnd
	
Section "Visual C++ Redist" Section4
	inetc::get /BANNER "Downloading VC Redist..." "https://aka.ms/vs/17/release/vc_redist.x86.exe" "vc_redist.x86.exe"
	Pop $0
	DetailPrint "VC Redist download status: $0"
	ExecWait "vc_redist.x86.exe /q /norestart"
	Delete "vc_redist.x86.exe"
	SectionEnd
	
Section ".NET Framework" Section5
	inetc::get /BANNER "Downloading .NET Framework..." "https://go.microsoft.com/fwlink/?LinkId=2085155" "ndp48_web.exe"
	Pop $0
	DetailPrint ".NET Framework download status: $0"
	ExecWait "ndp48_web.exe /q /norestart"
	Delete "ndp48_web.exe"
	SectionEnd
	
Section "Sim Shadow Fix" Section6
	MessageBox MB_OK "The shadow fix link will open in your browser. The installer is now creating a Downloads folder for your cc/mods."
	ExecShell "open" "https://simnopke.tumblr.com/post/136184612377/sim-shadow-fix" SW_SHOWNORMAL
	CreateDirectory "$Documents\EA Games\The Sims™ 2 Ultimate Collection\Downloads"
	ExecShell "open" "$Documents\EA Games\The Sims™ 2 Ultimate Collection\Downloads"
	SectionEnd

Section "Start Menu/Desktop Shortcut" Section7
	SetShellVarContext current
	CreateDirectory '$SMPROGRAMS\The Sims 2 Starter Pack\'
	CreateShortCut '$SMPROGRAMS\The Sims 2 Starter Pack\Launch Sims2RPC.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' 0
	CreateShortCut '$Desktop\The Sims 2 Starter Pack\Launch Sims2RPC.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' 0
	SectionEnd

LangString DESC_Section1 ${LANG_ENGLISH} "Installs The Sims 2 Ultimate Collection and Sims2RPC (minimal install)."
LangString DESC_Section2 ${LANG_ENGLISH} "Installs Graphics Rules Maker 2.0.0."
LangString DESC_Section3 ${LANG_ENGLISH} "Installs DXVK $DXVKVER. (Not recommended for beginners.)"
LangString DESC_Section4 ${LANG_ENGLISH} "Installs Visual C++ Redist (x86) if not already installed."
LangString DESC_Section5 ${LANG_ENGLISH} "Installs .NET Framework if not already installed."
LangString DESC_Section6 ${LANG_ENGLISH} "Links you to SimNopke's Shadow Fix. Install to TS2 Downloads folder. Intel users choose Not Misty version - Do not use with DXVK."
LangString DESC_Section7 ${LANG_ENGLISH} "Create a shortuct to launch the game in your Start Menu/Desktop."

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${Section1} $(DESC_Section1)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section2} $(DESC_Section2)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section3} $(DESC_Section3)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section4} $(DESC_Section4)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section5} $(DESC_Section5)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section6} $(DESC_Section6)	
  !insertmacro MUI_DESCRIPTION_TEXT ${Section7} $(DESC_Section7)

!insertmacro MUI_FUNCTION_DESCRIPTION_END
