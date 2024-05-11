/system script
add dont-require-permissions=no name=script1 owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local A [:put [/system health get value-name=value number=0]];\r\
    \n:local B [:put [/system health get value-name=value number=1]];\r\
    \n:local E [:put [/system routerboard get serial-number]];\r\
    \n:local F [:put [/system identity get value-name=name]];\r\
    \n:local G [:put [/ip address get value-name=address number=0]];\r\
    \n:local C qHuKULQD1CdQoPWiPZ4h8ZqgST0DnWe8uoZA0j1sUad ;\r\
    \n:local D http://linenotify.com/notify.php ;\r\
    \n/tool fetch url=\"\$D\?token=\$C&message=%0ANAME+=+\$F%0AIP+=+\$G%0ASN+=\
    +\$E%0AVOLT+=+\$A%0ATEMP+=+\$B\" keep-result=no"
add dont-require-permissions=no name=auto-upgrade-packages owner=admin \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source="/system package update check-for-updates\r\
    \n:if ([/system package update get installed-version] != [/system package \
    update get latest-version] ) do={\r\
    \n\t:log warning \"Upgrade packages from \$[/system package update get ins\
    talled-version] to \$[/system package update get latest-version]\";\r\
    \n\t/system package update install\r\
    \n}"
add dont-require-permissions=no name=auto-upgrade-routerboard owner=admin \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=":if ([/system routerboard get current-firmware] != [/system router\
    board get upgrade-firmware] ) do={\r\
    \n\t:log warning \"Upgrade routerboard from \$[/system routerboard get cur\
    rent-firmware] to \$[/system routerboard get upgrade-firmware]\";\r\
    \n\t/system routerboard upgrade\r\
    \n\t:delay 300s;\r\
    \n\t/system reboot\r\
    \n}"

/system scheduler
add name=auto-upgrade-packages on-event=\
    "/system/script/run auto-upgrade-packages" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2024-05-11 start-time=00:00:00
add name=auto-upgrade-routerboard on-event=\
    "/system/script/run auto-upgrade-routerboard" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2024-05-11 start-time=00:20:00
