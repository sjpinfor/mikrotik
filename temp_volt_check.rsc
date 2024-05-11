/system script
add dont-require-permissions=no name=temp_volt_check.rsc owner=admin policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=" 
:local A [:put [/system health get value-name=value number=0]];
:local B [:put [/system health get value-name=value number=1]];
:local E [:put [/system routerboard get serial-number]];
:local F [:put [/system identity get value-name=name]];
:local G [:put [/ip address get value-name=address number=0]];
:local C qHuKULQD1CdQoPWiPZ4h8ZqgST0DnWe8uoZA0j1sUad ;
:local D http://linenotify.com/notify.php ;
/tool fetch url="$D?token=$C&message=%0ANAME+=+$F%0AIP+=+$G%0ASN+=+$E%0AVOLT+=+$A%0ATEMP+=+$B" keep-result=no"
