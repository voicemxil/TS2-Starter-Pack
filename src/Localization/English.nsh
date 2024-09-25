!macro LANG_STRING NAME VALUE
  LangString "${NAME}" "${LANG_${LANG}}" "${VALUE}"
!macroend

!define LANG "ENGLISH"
!insertmacro LANG_STRING WEB_PAGE_HEADER_TEXT "TS2 Starter Pack: Web Installer"
!insertmacro LANG_STRING WEB_PAGE_HEADER_SUBTEXT "The Sims 2 Ultimate Collection - Origin repack by osab"

!insertmacro LANG_STRING WEB_WELCOMEPAGE_TITLE "The Sims 2 Starter Pack: Web Installer"
!insertmacro LANG_STRING WEB_WELCOMEPAGE_TEXT "Welcome to The Sims 2 Starter Pack Web Installer. This installer automatically downloads/installs The Sims 2 Ultimate Collection and dependencies/fixes for modern systems. $\n$\nPlease ensure you are using the latest version directly from the GitHub! $\n$\nThis installer guesses the game language based on your system locale, however you can change it if needed by applying the registry files in the included $\"_Language Selection$\" folder."

!insertmacro LANG_STRING UNCONFIRMPAGE_TEXT_TOP "WARNING: Before uninstalling, make sure the folder you chose contains ONLY the uninstaller and game files. $\n$\nThe game files MUST be in their own separate folder with no other essential data! I am not responsible for any data loss!"

!insertmacro LANG_STRING FINISHPAGE_TEXT "The installation has completed. To run the game, launch Sims2RPC or use the desktop/Start menu shortcut."
!insertmacro LANG_STRING FINISHPAGE_LINK "TS2 Community Discord Server!"
!insertmacro LANG_STRING FINISHPAGE_RUN_TEXT "Configure Sims2RPC Settings?"
