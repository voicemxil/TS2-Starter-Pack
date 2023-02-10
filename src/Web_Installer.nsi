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
OutFile "..\bin\Web Installer\TS2StarterPack.WebInstaller-v10.exe"
# Administrator Privileges 
RequestExecutionLevel admin
# Default Installation Directory
InstallDir "$PROGRAMFILES32\The Sims 2 Starter Pack"

!macro downloadPack packName packLink outputFile packSHA256
${Do}
	DetailPrint "Downloading ${packName} from ${packLink}. Closing the download window will interrupt the download."
	inetc::get /POPUP "Downloading ${packName}..." "${packLink}" "${outputFile}"
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "${packName} download status: $0" 
	filecheck::calcFileHash "${outputFile}" sha256
	Pop $R1
	${if} $R1 == "${packSHA256}"
		ExecWait '"${outputFile}" -InstallPath="$INSTDIR" -o"$INSTDIR" -y -gm1'
		${Break}
	${else}
		${If} ${Cmd} `MessageBox MB_RETRYCANCEL|MB_ICONEXCLAMATION "${outputFile} seems to be corrupted. This may be due to a bad connection or interrupted download. If you continue to see this message after retrying, consult the Discord. Would you like to retry?" /SD IDRETRY IDRETRY`
			Delete "${outputFile}"
		${Else}
			${Break}
		${Endif}
	${endif}
${Loop}
Delete "${outputFile}"
Pop $0
DetailPrint "Cleanup result: $0"
!macroend

Function .OnInit
	Dialer::AttemptConnect
	StrCpy $DXVKVER "2.1"
FunctionEnd

###########################
brandingText "osab Web Installer v10"
!define MUI_ABORTWARNING
!define MUI_HEADERIMAGE_RIGHT
!define MUI_HEADERIMAGE_BITMAP_STRETCH AspectFitHeight
!define MUI_HEADERIMAGE_BITMAP "..\assets\header.bmp"
!define MUI_ICON "..\assets\NewInstaller.ico"
!define MUI_PAGE_HEADER_TEXT "TS2: Starter Pack - Web Installer"
!define MUI_PAGE_HEADER_SUBTEXT "TS2 Ultimate Collection repacked by osab!"

!define MUI_WELCOMEPAGE_TITLE "osab's Sims 2 Starter Pack"
!define MUI_WELCOMEPAGE_TEXT "Welcome to the Sims 2 Starter Pack Web Installer (v10). Please ensure you have downloaded the latest version from the GitHub! Helpful log messages will be shown in the 'More Details' box."

!define MUI_LICENSEPAGE_TEXT_TOP "License Information:"

!define MUI_WELCOMEFINISHPAGE_BITMAP "C:\Users\c\Documents\v10.bmp"
!define MUI_FINISHPAGE_SHOWREADME "https://docs.google.com/document/d/1UT0HX3cO4xLft2KozGypU_N7ZcGQVr-54QD9asFsx5U/edit#heading=h.6jnaz4t6d3vx"
!define MUI_FINISHPAGE_SHOWREADME_TEXT "Open the next step of the guide (Graphics Setup)?"
!define MUI_FINISHPAGE_NOREBOOTSUPPORT
!define MUI_FINISHPAGE_LINK "TS2 Community Discord Server!"
!define MUI_FINISHPAGE_LINK_LOCATION "https://discord.gg/invite/ts2-community-912700195249197086"

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
InitPluginsDir
AddSize 13600000
	
StrCpy $Installer "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_Installer-v7.exe"
StrCpy $AL "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_ApartmentLife-v7.exe"
StrCpy $BoB "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_BestofBusiness-v7.exe"
StrCpy $BV "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_BonVoyage-v7.exe"
StrCpy $Base "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_Base-v10.exe"
StrCpy $DD "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_DoubleDeluxe-v7.exe"
StrCpy $FT "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_FreeTime-v7.exe"
StrCpy $FwP "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_FunwithPets-v8-norpc.exe"
StrCpy $GLS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_GlamourLifeStuff-v7.exe"
StrCpy $SS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_Seasons-v7.exe"
StrCpy $UNI "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v7/SFX_UniversityLife-v7.exe"
	
CreateDirectory "$INSTDIR\temp"
!insertmacro downloadPack "__Installer" "$Installer" "temp\SFX_Installer-v7.exe" "1a64ea3d40840462bc7ad8399e656d0c077af6fd15cc4e4157aa5e72968dacbe"
!insertmacro downloadPack "Apartment Life" "$AL" "temp\SFX_ApartmentLife-v7.exe" "ebd4fb1812b1b378b6318af21a75c14fe3b1cd8da0ee992177f89aa4806c8bcd"
!insertmacro downloadPack "Best of Business" "$BoB" "temp\SFX_BestofBusiness-v7.exe" "d91171a09683e8f6606ca5ccc45de1cb4c6f7e17c60be33654995718b9b5fa1b"
!insertmacro downloadPack "Bon Voyage" "$BV" "temp\SFX_BonVoyage-v7.exe" "9f5cb69f01ce6710eea8431923af066a34efe533c1acd3866a0f02be5c715944"
!insertmacro downloadPack "Base Game" "$Base" "temp\SFX_Base-v10.exe" "b0c80a7a90dc5b55df3d1cfd31ab967cf9c1440f4ca7a62a1170bdd0a9cd0837"
!insertmacro downloadPack "Double Deluxe Packs" "$DD" "temp\SFX_DoubleDeluxe-v7.exe" "750b642f31b9e21247f7ac61e12d35203fc41fe20c8dd7f19c6ddcdaf206f514"
!insertmacro downloadPack "FreeTime" "$FT" "temp\SFX_FreeTime-v7.exe" "61686cc9f047d590a956c42673baa3ca013b7ab826dd4c571e53d41e3aeafbb4"
!insertmacro downloadPack "Fun with Pets" "$FwP" "temp\SFX_FunwithPets-v8.exe" "c7f6c71a918d0a4a289c16a2e1b1de55641bc5b59feddb6b038ca1682a340681"
!insertmacro downloadPack "Glamour Life Stuff" "$GLS" "temp\SFX_GlamourLifeStuff-v7.exe" "246c4b4aec2e8e5987ad7adb73bb95d00ac96dcb0da4601b1ca8be5a3257cdb3"
!insertmacro downloadPack "Seasons" "$SS" "temp\SFX_Seasons-v7.exe" "daea01876749b37a005d01c05a2d1aab3f61427ef72acb5cb1a641757dc71917"
!insertmacro downloadPack "University Life" "$UNI" "temp\SFX_UniversityLife-v7.exe" "0ba83d90d7018dfb1e45ceec1476e4f6f20cf6e6f9cbf5d4212b3728654839ab"

DetailPrint "Touching Up..."
ExecWait '"$INSTDIR\__Installer\Touchup.exe" install -locale en_US -installPath "$INSTDIR" -autologging'

!insertmacro downloadPack "Sims2RPC" "https://github.com/voicemxil/TS2-Starter-Pack/raw/v10/components/SFX_Sims2RPC_1.15.exe" "$INSTDIR\SFX_Sims2RPC.exe" "39aa5c91cb584b63fec783db5554c67bf139ca8af13dd297f7cb2bc61056307c"
RMDir /r "$INSTDIR\temp"

DetailPrint "Adding Language Selection files."
CreateDirectory "$INSTDIR\__Language_Selection"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/Chinese_Simplified.reg" "$INSTDIR\__Language_Selection\Chinese_Simplified.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/Chinese_Traditional.reg" "$INSTDIR\__Language_Selection\Chinese_Traditional.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/Czech.reg" "$INSTDIR\__Language_Selection\Czech.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/Dutch.reg" "$INSTDIR\__Language_Selection\Dutch.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/English_UK.reg" "$INSTDIR\__Language_Selection\English_UK.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/Finnish.reg" "$INSTDIR\__Language_Selection\Finnish.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/French.reg" "$INSTDIR\__Language_Selection\French.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/German.reg" "$INSTDIR\__Language_Selection\German.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/Greek.reg" "$INSTDIR\__Language_Selection\Greek.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/Hebrew.reg" "$INSTDIR\__Language_Selection\Hebrew.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/Hungarian.reg" "$INSTDIR\__Language_Selection\Hungarian.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/Italian.reg" "$INSTDIR\__Language_Selection\Italian.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/Japanese.reg" "$INSTDIR\__Language_Selection\Japanese.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/Korean.reg" "$INSTDIR\__Language_Selection\Korean.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/Norwegian.reg" "$INSTDIR\__Language_Selection\Norwegian.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/Polish.reg" "$INSTDIR\__Language_Selection\Polish.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/Portuguese_Brazil.reg" "$INSTDIR\__Language_Selection\Portuguese_Brazil.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/Russian.reg" "$INSTDIR\__Language_Selection\Russian.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/Spanish.reg" "$INSTDIR\__Language_Selection\Spanish.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/Swedish.reg" "$INSTDIR\__Language_Selection\Swedish.reg"
Pop $0
DetailPrint "LS: $0"
inetc::get /BANNER "Adding language selection files to game folder..." "https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/main/language-selection/Thai.reg" "$INSTDIR\__Language_Selection\Thai.reg"	
Pop $0
DetailPrint "LS: $0"

DetailPrint "Tweaking Registry for compatibility..."
WriteRegStr HKLM32 "Software\EA GAMES\The Sims 2" "DisplayName" "The Sims 2 Ultimate Collection"
DetailPrint "Creating Downloads folder..."
CreateDirectory "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
SectionEnd
	
Section "Graphics Rules Maker" Section2
	CreateDirectory "$INSTDIR\temp"
	${If} ${RunningX64}
		inetc::get /POPUP "Downloading GRM Setup (64-bit detected)..." "https://www.simsnetwork.com/files/graphicsrulesmaker/graphicsrulesmaker-2.0.0-64bit.exe" "$INSTDIR\temp\grm_install.exe"
		Pop $0 # return value = exit code, "OK" means OK
		DetailPrint "GRM download status: $0. Executing installer..." 
	${Else}
		inetc::get /POPUP "Downloading GRM Setup (32-bit detected)..." "https://www.simsnetwork.com/files/graphicsrulesmaker/graphicsrulesmaker-2.0.0-32bit.exe" "$INSTDIR\temp\grm_install.exe"
		Pop $0 # return value = exit code, "OK" means OK
		DetailPrint "GRM download status: $0. Executing installer..." 
	${EndIf}
		Execwait "$INSTDIR\temp\grm_install.exe"
		Delete "$INSTDIR\temp\grm_install.exe"
		Pop $0
		DetailPrint "Cleanup result: $0"
		RMDir /r "$INSTDIR\temp"
SectionEnd

Section /o "DXVK" Section3
	CreateDirectory "$INSTDIR\temp"
	inetc::get /POPUP "Preparing Vulkan Test..." "https://github.com/skeeto/vulkan-test/releases/download/1.0.2/vulkan_test.exe" "temp\vulkan_test.exe"
	ExecWait "temp\vulkan_test.exe"
	Delete "temp\vulkan_test.exe"
	MessageBox MB_YESNO "DXVK requires Vulkan support. If the message box said it successfully created a Vulkan instance, click Yes. Otherwise, click NO." IDYES true IDNO false
	true: 
		DetailPrint "Downloading DXVK $DXVKVER ..."
		inetc::get /POPUP "Downloading DXVK..." "https://github.com/doitsujin/dxvk/releases/download/v2.1/dxvk-2.1.tar.gz" "$INSTDIR\temp\dxvk.tar.gz"
		Pop $0 # return value = exit code, "OK" means OK
		DetailPrint "DXVK download status: $0. Extracting..." 

		inetc::get /POPUP "Downloading DXVK.conf..." "https://github.com/doitsujin/dxvk/blob/v2.1/dxvk.conf" "$INSTDIR\Fun with Pets\SP9\TSBin\dxvk.conf"
		Pop $0
		DetailPrint "DXVK.conf download status: $0. Extracting..." 

		untgz::extract -h -u -d "$INSTDIR\temp" -zgz "$INSTDIR\temp\dxvk.tar.gz"
		Pop $0 
		DetailPrint "DXVK extraction status: $0. Deleting archive..." 

		Delete "$INSTDIR\temp\dxvk.tar.gz"
		Pop $0
		DetailPrint "Cleanup result: $0"
		DetailPrint "Placing x32 d3d9.dll in TSBin..."
		Rename "$INSTDIR\temp\dxvk-2.1\x32\d3d9.dll" "$INSTDIR\Fun with Pets\SP9\TSBin\d3d9.dll"
		Pop $0
		DetailPrint "File move result: $0"

		RMDir /r "$INSTDIR\temp\dxvk-2.1"
		Pop $0
		DetailPrint "Cleanup result: $0"
	false:
		DetailPrint "Vulkan is unsupported, DXVK will be skipped."
	next:
		DetailPrint "DXVK section complete."
		RMDir /r "$INSTDIR\temp"
SectionEnd
	
Section "Visual C++ Redist" Section4
	CreateDirectory "$INSTDIR\temp"	
	inetc::get /POPUP "Downloading VC Redist..." "https://aka.ms/vs/17/release/vc_redist.x86.exe" "temp\vc_redist.x86.exe"
	Pop $0
	DetailPrint "VC Redist download status: $0"
	ExecWait "temp\vc_redist.x86.exe /q /norestart"
	Delete "temp\vc_redist.x86.exe"
		Pop $0
		DetailPrint "Cleanup result: $0"
	RMDir /r "$INSTDIR\temp"
		Pop $0
		DetailPrint "Cleanup result: $0"	
SectionEnd
	
Section ".NET Framework" Section5
	CreateDirectory "$INSTDIR\temp"	
	inetc::get /POPUP "Downloading .NET Framework..." "https://go.microsoft.com/fwlink/?LinkId=2085155" "temp\ndp48_web.exe"
	Pop $0
	DetailPrint ".NET Framework download status: $0"
	ExecWait "temp\ndp48_web.exe /q /norestart"
	Delete "temp\ndp48_web.exe"
		Pop $0
		DetailPrint "Cleanup result: $0"
	RMDir /r "$INSTDIR\temp"
		Pop $0
		DetailPrint "Cleanup result: $0"
SectionEnd
	
Section "Sim Shadow Fix" Section6
	SetOutPath "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
	inetc::get /POPUP "Downloading SimNopke's Shadow Fix" "https://github.com/voicemxil/TS2-Starter-Pack/raw/v10/components/simNopke-simShadowFix0.3reallyNotMisty.package" "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads\simNopke-simShadowFix0.3reallyNotMisty.package"
	Pop $0
	DetailPrint "Shadow Fix download status: $0"
	ExecShell "open" "$Documents\EA Games\The Sims 2 Ultimate Collection\Downloads"
SectionEnd

Section "Start Menu/Desktop Shortcut" Section7
	SetShellVarContext current
	SetOutPath "$INSTDIR\Fun with Pets\SP9\TSBin"
	CreateDirectory '$SMPROGRAMS\The Sims 2 Starter Pack\'
	CreateShortCut '$SMPROGRAMS\The Sims 2 Starter Pack\Sims2RPC.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' 0
	CreateShortCut '$Desktop\Sims2RPC.lnk' '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' "" '$INSTDIR\Fun with Pets\SP9\TSBin\Sims2RPC.exe' 0
	SectionEnd 

LangString DESC_Section1 ${LANG_ENGLISH} "Installs The Sims 2 Ultimate Collection and Sims2RPC v1.15 (minimal install)."
LangString DESC_Section2 ${LANG_ENGLISH} "Installs Graphics Rules Maker 2.0.0."
LangString DESC_Section3 ${LANG_ENGLISH} "Installs DXVK $DXVKVER. (Not recommended for beginners.)"
LangString DESC_Section4 ${LANG_ENGLISH} "Installs Visual C++ Redist (x86) if not already installed."
LangString DESC_Section5 ${LANG_ENGLISH} "Installs .NET Framework if not already installed."
LangString DESC_Section6 ${LANG_ENGLISH} "Installs SimNopke's Sim Shadow Fix to your downloads folder. *Don't Use With DXVK*."
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
