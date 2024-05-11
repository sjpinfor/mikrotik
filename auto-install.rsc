/system routerboard settings set auto-upgrade=yes
/tool fetch https://raw.githubusercontent.com/sjpinfor/mikrotik/main/auto-upgrade-packages.rsc;
:delay 5s;
/import auto-upgrade-packages.rsc;
