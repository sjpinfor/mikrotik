:local date [:put [/system clock get date]];
:local time [:put [/system clock get time]];
:local dtime ($date . "T" . $time)
:local dname [:put [/system identity get value-name=name]];
:local dip [:put [/ip address get value-name=address number=0]];
:local dsn [:put [/system routerboard get serial-number]];
:local dvolt [:put [/system health get value-name=value number=0]];
:local dtemp [:put [/system health get value-name=value number=1]];

:local jsonData ("{ \"dtime\": \"$dtime\", \"dname\": \"$dname\", \"dip\": \"$dip\", \"dsn\": \"$dsn\", \"dtemp\": $dtemp, \"dvolt\": $dvolt }")

:local ip "125.25.183.243:3001"
:local url ("http://".$ip."/api/v1/log/rec")

/tool fetch url=$url http-method=post http-header-field="Content-Type: application/json" http-data=$jsonData