#!/bin/bash
# Usage:
#   curl https://raw.githubusercontent.com/mixool/script/master/nibbleblog-v4.0.2-markdown.sh | bash

export URL="http://sourceforge.net/projects/nibbleblog/files/v4.0/nibbleblog-v4.0.2-markdown.zip"

if [ "$(id -u)" != "0" ]; then
    echo "ERROR: Please run as root"
    exit 1
fi

echo "1. Updating install"
apt-get update
apt-get install apache2 curl unzip php5-common libapache2-mod-php5  php5-gd php5-mcrypt -y

echo "2. Download nibbleblog-markdown from $RINET_URL and setup"
curl -L "${URL}" >/var/www/html/nibbleblog-markdown.zip
unzip /var/www/html/nibbleblog-markdown.zip
mv /var/www/html/nibbleblog-markdown/* /var/www/html/
rm -rf /var/www/html/nibbleblog-markdown /var/www/html/index.html /var/www/html/nibbleblog-markdown.zip
chmod 777 /var/www/html/content

echo "3. service apache2 restart"
service apache2 restart
