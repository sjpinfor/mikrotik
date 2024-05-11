/tool fetch https://raw.githubusercontent.com/sjpinfor/mikrotik/main/temp_volt_check.rsc;
:delay 5s;
/system scheduler add name=temp_volt_check on-event="/import temp_volt_check.rsc" policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon start-time=00:05:00;
