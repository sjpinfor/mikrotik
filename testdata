:local A [:put [/system health get value-name=value number=0]];
:local B [:put [/system health get value-name=value number=1]];
:local E [:put [/system routerboard get serial-number]];
:local F [:put [/system identity get value-name=name]];
:local G [:put [/ip address get value-name=address number=0]];
:local H https://script.google.com/macros/s/AKfycbxjUpAGOjbdLwqHPZ3jDEMUFwZCXyg4Tw8jiSYIeE0qtt0tiYeEjCLY0RBfjl27hVAfaA/exec;
/tool fetch keep-result=no mode=https url="$H?action=addData" http-method=post http-header-field="Content-Type:application/json" http-data="{\"NAME\":\"$F\",\"IP\":\"$G\",\"SN\":\"$E\",\"VOLT\":\"$A\",\"TEMP\":\"$B\"}"
