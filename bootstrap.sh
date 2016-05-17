#!/usr/bin/env bash

# apt-get install -y ruby-sass
# apt-get install -y ruby-compass
# gem install compass
# composer config --global process-timeout 2000
# /bin/bash /var/www/public/magento2/firstRun
# echo "*/5 * * * * vagrant php /var/www/public/magento2/bin/magento cron:run" >> mycron
# crontab mycron
# rm mycron

chown vagrant:vagrant /home/vagrant/.composer/auth.json
chown -R vagrant:vagrant /home/vagrant

cp -r /opt/magento1 /var/www/public/
cp -r /opt/magento2 /var/www/public/


