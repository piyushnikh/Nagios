#!/bin/bash

##Make sure this script is placed inside nagios-plugins-x.x.x folder##

##Execute configure file on server##

./configure --enable-command-args

##Run the make & make install command to compile & install plugins on server##

make
make install
sleep 3

##Run Pre-flight check for Nagios server##

/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg

##Enable & start nagios on server##

systemctl enable nagios
systemctl start nagios
systemctl status nagios

##Allow HTTP/HTTPS port on the server by below commands & reload firewall##

firewall-cmd --permanent --add-service={http,https}
firewall-cmd --reload
