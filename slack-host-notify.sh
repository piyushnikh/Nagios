#!/bin/bash

# Edit your Slack hook URL and footer icon URL
SLACK_URL=https://hooks.slack.com/services/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
FOOTER_ICON=http://env.baarnes.com/Nagios.png

# Host Notification command example :

# define command {
#       command_name                          slack-host
#       command_line                          /usr/lib64/nagios/plugins/slack_host_notify "$NOTIFICATIONTYPE$"  "$HOSTNAME$" "$HOSTADDRESS$" "$HOSTSTATE$" "$HOSTOUTPUT$" "$LONGDATETIME$"
# }

case $4 in

"DOWN")
  MSG_COLOR="danger"
  ;;
"UP")
  MSG_COLOR="good"
  ;;
*)
  MSG_COLOR="#CCCCCC"
  ;;
esac

IFS='%'

SLACK_MSG="payload={\"attachments\":[{\"color\": \"$MSG_COLOR\",\"title\": \"Host $1 notification\",
\"text\": \"Host:        $2\\nIP:             $3\\nState:        $4\"},
{\"color\": \"$MSG_COLOR\",\"title\":\"Additional Info :\",\"text\":\"\\n$5\",
\"footer\": \"Nagios notification: $6\",\"footer_icon\": \"$FOOTER_ICON\"}]}"

#Send message to Slack
curl -4 -X POST --data "$SLACK_MSG" $SLACK_URL

unset IFS
