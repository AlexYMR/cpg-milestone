#!/bin/bash
#depends on CPG-userdata-exported variables
sudo apt-get -y update
#install git
sudo apt-get -y install git-core
#install Apache Web Server on Ubuntu 16 LTS
sudo apt-get -y install apache2
#set permissions on the html folder so files can be copied
sudo chmod 777 var/www/html/
#download website files from git
sudo git clone https://github.com/AlexYMR/cpg-milestone
#copy the downloaded content to the Apache www directory
mv /cpg-milestone/*.* /var/www/html
mv /cpg-milestone/css /var/www/html
mv /cpg-milestone/img /var/www/html
#restart the webserver...
sudo systemctl start apache2.service
#replace placeholder text in static website page with user input
sudo sed -i "s,WEBPAGE_TITLE,$WEB_TITLE,g" /var/www/html/index.html
sudo sed -i "s,WEBPAGE_HEADER,$WEB_HEADER,g" /var/www/html/index.html
sudo sed -i "s,WEBPAGE_SUBHEADER,$WEB_SUBHEADER,g" /var/www/html/index.html
sudo sed -i "s,milestone.jpg,$WEB_BACKGROUND.jpg,g" /var/www/html/css/custom.css