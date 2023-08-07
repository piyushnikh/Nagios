#!/bin/bash

##Take 2.2.3 version of plugins and install on server##

wget https://github.com/nagios-plugins/nagios-plugins/releases/download/release-2.3.3/nagios-plugins-2.3.3.tar.gz
tar -xvzf nagios-plugins-2.3.3.tar.gz

echo "Download & extraction completed, proceed inside extracted folder !"