cd '/workspaces/'${RepositoryName}

LOG_FILE=${PWD}'/.dotfiles/log_WIP.txt'
echo "Dotfiles Log File "$LOG_FILE

if [ ! -d $PWD'/.dotfiles' ]; then
    mkdir $PWD'/.dotfiles'
fi

date +"%FORMAT_STRING"

echo "Dotfile_WIP loaded at $(date +"%H:%M:%SS, %d_%m_%Y")" > $LOG_FILE



## -------- PHP debug ------
# This is left here as a template, it all works, but is better put into the prebuild or post build, as it's general use


# this is to be done on the host.
# we have two, the main machine for cmfive.php,
# and webapp
#docker exec nginx-php7.4 apt-get -y install php-xdebug

# apt update
# apt -y install php-fpm >> $LOG_FILE

# which php >> $LOG_FILE



### ------- CS fixer --------
# mkdir /tools/cs-fixer
# cd /tools/cs-fixer
# wget https://cs.symfony.com/download/php-cs-fixer-v3.phar -O php-cs-fixer >> $LOG_FILE

# chmod a+x php-cs-fixer
# mv php-cs-fixer /usr/local/bin/php-cs-fixer

# which php-cs-fixer >> $LOG_FILE

