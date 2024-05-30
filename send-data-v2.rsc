:local A1 [:put [/system clock get date]];
:local B1 [:put [/system clock get time]];
:local A [:put [/system health get value-name=value number=0]];
:local B [:put [/system health get value-name=value number=1]];
:local E [:put [/system routerboard get serial-number]];
:local F [:put [/system identity get value-name=name]];
:local G [:put [/ip address get value-name=address number=0]];
:local H http://192.168.110.88:3003/api/v1/test_log;
/tool fetch keep-result=no mode=http url="$H" http-method=post http-header-field="Content-Type:application/json" http-data="{\"n\":\"$F\",\"ip\":\"$G\",\"sn\":\"$E\",\"v\":\"$A\",\"t\":\"$B\",\"d\":\"$A1\",\"time\":\"$B1\"}"
