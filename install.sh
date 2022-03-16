
LOG_FILE="/workspaces/cmfive-boilerplate/.dotfiles/log.txt"
mkdir /workspaces/cmfive-boilerplate/.dotfiles

## Set an environment variable for user email 
CMFIVE_USER_EMAIL=dane@2pisofftware.com
export CMFIVE_USER_EMAIL

# Add additional extensions 
code --install-extension "Gruntfuggly.todo-tree" 
code --install-extension "oderwat.indent-rainbow"
code --install-extension "mhutchie.vscode-git-graph"
#code --install-extension "ivanhofer.git-assistant" ## I don't know if I want this one yet. 


## PHP debug
# this is to be done on the host.
# we have two, the main machine for cmfive.php, 
# and webapp 
#docker exec nginx-php7.4 apt-get -y install php-xdebug



# This is left here as a template, it all works, but is better put into the prebuild or post build, as it's general use 

# apt update
# apt -y install php-fpm >> $LOG_FILE

# which php >> $LOG_FILE

# # CS fixer 
# mkdir /tools/cs-fixer
# cd /tools/cs-fixer
# wget https://cs.symfony.com/download/php-cs-fixer-v3.phar -O php-cs-fixer >> $LOG_FILE

# chmod a+x php-cs-fixer
# mv php-cs-fixer /usr/local/bin/php-cs-fixer

# which php-cs-fixer >> $LOG_FILE

exit 0

