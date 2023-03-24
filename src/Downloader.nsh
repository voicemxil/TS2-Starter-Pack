!macro downloadPack packName packLink outputFile packSHA256
${Do}
	DetailPrint "Downloading ${packName} from ${packLink}. Closing the download window will interrupt the download."
	NScurl::http GET "${packLink}" "${outputFile}" /RESUME /INSIST /CANCEL /END
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "${packName} download status: $0" 
	NScurl::sha256 "${outputFile}"
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