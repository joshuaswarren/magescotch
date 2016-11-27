#!/usr/bin/env bash

sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile

chown vagrant:vagrant /home/vagrant/.composer/auth.json
chown -R vagrant:vagrant /home/vagrant

cp -r /opt/magento1 /var/www/public/
cp -r /opt/magento2 /var/www/public/

cd /var/www/public/magento1/
chmod -R a+rw * 
modman init
chmod -R a+rw .modman
modman clone https://github.com/Inchoo/Inchoo_PHP7
chmod -R a+rw .modman
modman repair
chmod -R a+rw .modman
magerun cache:flush
magerun sys:setup:run

cp /home/vagrant/magemalt_version.txt /var/www/public/magemalt_provisioned_version.txt
