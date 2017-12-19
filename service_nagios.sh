#!/bin/bash

WEBHOST_NAGIOS="asgard.rtswv.com"
SLACK_CHANNEL="#mcdonaldtest"
SLACK_BOTNAME="NagiosMcDonald"
WEBHOOK_URL=""
NAGIOS_HOSTNAME=$1
SERVICE_NAME=$2
SERVICE_STATE=$3
SERVICEOUTPUT=$4

#Set the message icon based on Nagios service state
if [ "$SERVICE_STATE" = "OK" ]
then
    ICON_EMOJI=":thumbsup:"
elif [ "$SERVICE_STATE" = "WARNING" ]
then
    ICON_EMOJI=":loudspeaker:"
elif [ "$SERVICE_STATE" = "CRITICAL" ]
then
    ICON_EMOJI=":broken_heart:"
elif [ "$SERVICE_STATE" = "UNKNOWN" ]
then
    ICON_EMOJI=":troll:"
else
    ICON_EMOJI=":octocat:"
fi


#request for posting to a channel
curl -X POST --data "payload={\"channel\": \"${SLACK_CHANNEL}\", \"username\": \"${SLACK_BOTNAME}\", \"icon_emoji\": \":vertical_traffic_light:\", \"text\": \"${ICON_EMOJI} HOST: ${NAGIOS_HOSTNAME}   \nSERVICE: ${SERVICE_NAME} \nSTATE: ${SERVICE_STATE} \nMESSAGE: ${SERVICEOUTPUT} \"}" https://hooks.slack.com/services/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
