:local bot "7697723175:AAGN7cpIPXYwIX190XTm49qc3e7NeLStqmg"
:local ChatID "-4898511256"
:local myserver ("%F0%9F%94%B4"." ".[/system identity get name]." ".[/system resource get board-name]." %F0%9F%94%B4")
:local scheduleName "LogFilter-SJP"
:local startBuf [:toarray [/log find where message~"(invalid MAC address|login failure|loop|fcs|excessive|rebooted|ipsec|ike2|untrusted|flooding|device added|device changed)" \ or topics~"(error|critical|account)"]]
:local removeThese {"link";"telnet"}
:local event "/system/script/run $scheduleName"
:global mesnum
:local date [/system clock get date]
:if ([:len [/system scheduler find name="$scheduleName"]] = 0) do={
/log warning "[LogFilter] Alert : Schedule does not exist. Creating schedule ...."
/system scheduler add name=$scheduleName interval=30s start-date=Jan/01/1970 start-time=00:00:00 on-event=$event
/log warning "[LogFilter] Alert : Schedule created!"
}
:local lastTime [/system scheduler get [find name="$scheduleName"] comment]
:local currentTime
:local message
:local output
:local keepOutput false
:if ([:len $lastTime] = 0) do={
  :set keepOutput true
}
:local counter 0
:foreach i in=$startBuf do={
:local keepLog true
:foreach j in=$removeThese do={
:if ([/log get $i message] ~ "$j") do={
:set keepLog false
}
}
:if ($keepLog = true) do={
:set message [/log get $i message]
:set currentTime [ /log get $i time ]
:if ([:len $currentTime] = 8 ) do={
:set currentTime ([:pick [/system clock get date] 0 11]." ".$currentTime)
} else={
:if ([:len $currentTime] = 15 ) do={
:set currentTime ([:pick $currentTime 0 6]."/".[:pick [/system clock get date] 7 11]." ".[:pick $currentTime 7 15])
}
}
:if ($keepOutput = true) do={
:set output ($output.$currentTime."%0A".$message."%0A%0A")
}
:if ($currentTime = $lastTime) do={
:set keepOutput true
:set output ""
}
}                                                                                                                            
:if ($counter = ([:len $startBuf])-1) do={
:if ($keepOutput = false) do={
:if ([:len $message] > 0) do={
:set output ($output.$currentTime."%0A".$message)
}
}
}
:set counter ($counter + 1)
}
if ([:len $output] > 0) do={
/system scheduler set [find name="$scheduleName"] comment=$currentTime
/tool fetch url="https://api.telegram.org/bot$bot/sendMessage\?chat_id=$ChatID&text=$myserver%0A%0A$output" keep-result=no;
}
