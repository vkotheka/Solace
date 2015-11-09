#!/bin/bash

IP=52.23.229.18:8080
CRED=admin:admin
VPN=DataPowerDemo
TOPIC=create/customer/normal
QUEUE=NormalCustomer

CREATE_QUEUE="\
<rpc semp-version=\"soltr/6_1\">
    <message-spool>
        <vpn-name>${VPN}</vpn-name>
        <create>
            <queue>
                <name>${QUEUE}</name>
            </queue>
        </create>
    </message-spool>
</rpc>\
"
QUEUE_ACC="\
<rpc semp-version=\"soltr/6_1\">
    <message-spool>
        <vpn-name>${VPN}</vpn-name>
        <queue>
            <name>${QUEUE}</name>
            <access-type>
                <non-exclusive></non-exclusive>
            </access-type>
        </queue>
    </message-spool>
</rpc>\
"
QUEUE_PERM="\
<rpc semp-version=\"soltr/6_1\">
    <message-spool>
        <vpn-name>${VPN}</vpn-name>
        <queue>
            <name>${QUEUE}</name>
            <permission>
                <all></all>
                <delete></delete>
            </permission>
        </queue>
    </message-spool>
</rpc>\
"
SUB_TOPIC="\
<rpc semp-version=\"soltr/6_1\">
    <message-spool>
        <vpn-name>${VPN}</vpn-name>
        <queue>
            <name>${QUEUE}</name>
            <subscription>
                <topic>${TOPIC}</topic>
            </subscription>
        </queue>
    </message-spool>
</rpc>\
"

QUEUE_START="\
<rpc semp-version=\"soltr/6_1\">
    <message-spool>
        <vpn-name>${VPN}</vpn-name>
        <queue>
            <name>${QUEUE}</name>
            <no>
                <shutdown></shutdown>
            </no>
        </queue>
    </message-spool>
</rpc>\
"
echo "${CREATE_QUEUE}" | curl -d @- -u "${CRED}" http://${IP}/SEMP
echo "${QUEUE_ACC}" | curl -d @- -u "${CRED}" http://${IP}/SEMP
echo "${QUEUE_PERM}" | curl -d @- -u "${CRED}" http://${IP}/SEMP
echo "${SUB_TOPIC}" | curl -d @- -u "${CRED}" http://${IP}/SEMP
echo "${QUEUE_START}" | curl -d @- -u "${CRED}" http://${IP}/SEMP
