#!/bin/bash

IP=52.23.167.0:8080
CRED=admin:admin
VPN=testScript
TOPIC=customer/create
QUEUE=qCustAnalytics
TOPIC1=a/b/c
TOPIC1=d/e/f

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
SUB_TOPIC1="\
<rpc semp-version=\"soltr/6_1\">
    <message-spool>
        <vpn-name>${VPN}</vpn-name>
        <queue>
            <name>${QUEUE}</name>
            <subscription>
                <topic>${TOPIC1}</topic>
            </subscription>
        </queue>
    </message-spool>
</rpc>\
"
SUB_TOPIC2="\
<rpc semp-version=\"soltr/6_1\">
    <message-spool>
        <vpn-name>${VPN}</vpn-name>
        <queue>
            <name>${QUEUE}</name>
            <subscription>
                <topic>${TOPIC2}</topic>
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
echo "${SUB_TOPIC1}" | curl -d @- -u "${CRED}" http://${IP}/SEMP
echo "${QUEUE_START}" | curl -d @- -u "${CRED}" http://${IP}/SEMP
