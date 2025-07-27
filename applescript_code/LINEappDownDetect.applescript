property flagFile : POSIX path of (path to library folder from user domain) & "line_offline_flag"

tell application "System Events"
	if not (exists process "LINE") then
		set flagFileRef to a reference to file (flagFile)
		
		-- フラグファイルが存在しない場合のみ通知
		if not (exists flagFileRef) then
			-- 通知を表示
			beep 5
			display notification "Mac版LINEが終了しています。" with title "LINEのステータス"
			
			-- 通知を表示したことを示すフラグファイルを作成
			do shell script "touch " & quoted form of flagFile
		end if
	else
		-- アプリケーションが起動している場合、フラグファイルを削除
		do shell script "rm -f " & quoted form of flagFile
	end if
end tell
