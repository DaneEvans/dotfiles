
LOG_FILE="/workspaces/cmfive-boilerplate/.dotfiles/log.txt"
mkdir /workspaces/cmfive-boilerplate/.dotfiles

apt update
#php
apt -y install php-fpm >> $LOG_FILE

echo which php >> $LOG_FILE

# CS fixer 
mkdir /tools/cs-fixer
cd /tools/cs-fixer
wget https://cs.symfony.com/download/php-cs-fixer-v3.phar -O php-cs-fixer >> $LOG_FILE

chmod a+x php-cs-fixer
mv php-cs-fixer /usr/local/bin/php-cs-fixer

echo which php-cs-fixer >> $LOG_FILE

exit 0

# php 
