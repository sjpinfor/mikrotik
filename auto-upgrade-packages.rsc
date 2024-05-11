/system package update check-for-updates
:if ([/system package update get installed-version] != [/system package update get latest-version] ) do={
	:log warning "Upgrade packages from $[/system package update get installed-version] to $[/system package update get latest-version]";
	/system package update install
}
