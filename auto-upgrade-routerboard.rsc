:if ([/system routerboard get current-firmware] != [/system routerboard get upgrade-firmware] ) do={
	:log warning "Upgrade routerboard from $[/system routerboard get current-firmware] to $[/system routerboard get upgrade-firmware]";
	/system routerboard upgrade
	:delay 10s;
	/system reboot
}
