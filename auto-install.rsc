/file remove auto-upgrade-packages.rsc
/file remove auto-upgrade-routerboard.rsc

:delay 5s;

/tool fetch https://raw.githubusercontent.com/sjpinfor/mikrotik/main/auto-upgrade-packages.rsc
/tool fetch https://raw.githubusercontent.com/sjpinfor/mikrotik/main/auto-upgrade-routerboard.rsc

:delay 5s;

/import auto-upgrade-packages.rsc
/import auto-upgrade-routerboard.rsc
