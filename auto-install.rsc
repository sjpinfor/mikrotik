/system script remove auto-upgrade-routerboard
/system script remove auto-upgrade-packages
/system scheduler remove auto-upgrade-routerboard
/system scheduler remove auto-upgrade-packages

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
