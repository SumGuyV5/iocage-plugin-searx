#!/bin/sh -x
IP_ADDRESS=$(ifconfig | grep -E 'inet.[0-9]' | grep -v '127.0.0.1' | awk '{ print $2}')
KEY=$(openssl rand -base64 20 | md5 | head -c16)$(openssl rand -base64 20 | md5 | head -c16)

HOST_NAME=searx.richardallenonline.com
SEARX_HOST=127.0.0.1:8888

#Searx user
pw useradd -n searx -c "Searx Search Engine" -d /usr/home/searx 

sed ./usr/local/etc/searx-settings.yml

sed -i.bak "s/ultrasecretkey/${KEY}/g" /usr/local/etc/searx-settings.yml
sed -i.bak 's/127.0.0.1/0.0.0.0/g' /usr/local/etc/searx-settings.yml

sysrc searx_enable="YES"
service searx start

echo -e "Searx now installed.\n" > /root/PLUGIN_INFO
echo -e "\nPlease open your web browser and go to http://${IP_ADDRESS}:8888 to configure Sear.x\n" >> /root/PLUGIN_INFO