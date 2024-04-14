#!/bin/bash

##Make sure this script is placed inside nagios-x.x.x folder##

##Execute configure file on server##

./configure --enable-command-args
sleep 3

##After this do the make all command & compile the code on server##

make all
sleep 3

##Make users & groups on server##

make install-groups-users
sleep 3

##Next add apache user in nagios group on server##

usermod -a -G nagios apache
sleep 3

##Install nagios base by below command on server##

make install
sleep 3

##Install scripts installation on server##

make install-daemoninit
sleep 3

##Install command mode on server##

make install-commandmode
sleep 3

##Install config files on server##

make install-config
sleep 3

##Install web interface on server##

make install-webconf
sleep 3

##Install exfoliation theme on server##

make install-exfoliation
sleep 3

##Set password on server##

sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin

##Restart httpd on server##

sudo systemctl restart httpd
sleep 3

##Pre-flight check for Nagios##

/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
