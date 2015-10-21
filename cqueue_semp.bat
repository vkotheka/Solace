
set IP=52.23.167.0:8080
set CRED=admin:admin

set VPN=testScript
set TOPIC=customer/create
set QUEUE=qCustAnalytics
set TOPIC1=a/b/c

setlocal EnableDelayedExpansion



set SUB_TOPIC1=<rpc semp-version=\"soltr/6_1\"<message-spool><vpn-name>%VPN%</vpn-name><queue><name>%QUEUE%</name><subscription><topic>%TOPIC1%</topic></subscription></queue</message-spool>
</rpc>


echo "%SUB_TOPIC1%"
curl -d @- -u "%CRED%" http://%IP%/SEMP

