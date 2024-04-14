#!/bin/bash

##The below commands are to set timedate on server & host##

sudo hostnamectl set-hostname nagios-core
sudo timedatectl set-timezone Asia/Calcutta
date
sleep 5

#Install firewall for RHEL, by default it's not present in RHEL 9.x.x.##

yum install firewalld -y
sudo systemctl enable firewalld
sudo systemctl start firewalld
sleep 5

##Change SELINUX to be enforcing on server & host##

sed -i s/^SELINUX=.*$/SELINUX=permissive/ /etc/selinux/config && setenforce 0
getenforce && sestatus
sleep 5

##Install all upadates on RHEL Servers##

dnf update -y
echo "Updates complete !"

##Install pre-requiste packages##

dnf install php perl httpd wget unzip glibc automake glibc-common gettext autoconf php php-cli gcc gd gd-devel net-snmp openssl-devel unzip net-snmp postfix net-snmp-utils net-tools -y
dnf groupinstall "Development Tools" -y
echo "Packages & development tools are installed !"
sleep 5

##Start php & httpd services on server##

sudo systemctl enable --now httpd php-fpm
sudo systemctl start --now httpd php-fpm
sleep 5
echo "init scripts created, services enabled & started !"
