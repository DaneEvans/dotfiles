
LOG_FILE=${PWD}'/.dotfiles/log.txt'
echo "Dotfiles Log File "$LOG_FILE

if [ ! -d $PWD'/.dotfiles' ]; then 
    mkdir $PWD'/.dotfiles'
fi

#touch $LOG_FILE
echo "Dotfile loaded" > $LOG_FILE

if ! grep -Fxq '.dotfiles/' $PWD'/.gitignore'
then
    echo "" >> $PWD'/.gitignore'
    echo "#Dotfiles " >> $PWD'/.gitignore'
    echo '.dotfiles/' >> $PWD'/.gitignore'
    echo "Added lines to .gitignore" >> $LOG_FILE

fi
echo "Done .gitignore" >> $LOG_FILE


## Set an environment variable for user email 
CMFIVE_USER_EMAIL=dane@2pisoftware.com
export CMFIVE_USER_EMAIL
echo "Set Your email" >> $LOG_FILE


## Setup GHCLI 
# uses GITHUB_TOKEN 
# dump the existing token, it has no rights 
export GITHUB_TOKEN=
# Copy in the one from the secrets. note, this is only valid for this script
export GITHUB_TOKEN=${PERSONAL_TOKEN}
gh cs list
## gets us this list, but doesn't persist ... 
echo "Got a codespaces list" >> $LOG_FILE

#export GITHUB_TOKEN=

#gh auth login --with-token <<< ${ALL_TOKEN}

## Setup the ssh key
#ssh-keygen -t rsa -b 4096 -C "your_email@example.com"eval "$(ssh-agent -s)"
#ssh-add - <<< "${PERSONAL_SSH_KEY}"

echo "Setting up SSH keys" >> $LOG_FILE

SSH_DIR="/home/vscode/.ssh"
if [ ! -d $SSH_DIR ]; then
    mkdir $SSH_DIR
fi

if [ -f $SSH_DIR"/id_rsa" ]
then 
    printf "%s" "${PERSONAL_SSH_KEY}" > $SSH_DIR"/id_rsa"
else 
    touch '/home/vscode/.ssh/id_rsa'
    printf "%s" "${PERSONAL_SSH_KEY}" > $SSH_DIR"/id_rsa"
fi
chmod 400 $SSH_DIR"/id_rsa" 

echo "Done ssh keys. " >> $LOG_FILE

echo "add GH to hosts" >> $LOG_FILE

## ad github to hosts to prevent a warning 
if ! grep github.com $SSH_DIR/known_hosts > /dev/null
then
	ssh-keyscan github.com >> $SSH_DIR/known_hosts
fi

echo "Cloning a private repo " >> $LOG_FILE


# test clone a private repo 
git clone git@github.com:2pisoftware/artifax-module-bundle.git $PWD'/artifax-module-bundle'

echo "Done" >> $LOG_FILE

exit 0 

# Add additional extensions 
code --install-extension "Gruntfuggly.todo-tree" 
code --install-extension "oderwat.indent-rainbow"
code --install-extension "mhutchie.git-graph"
code --install-extension "eamodio.gitlens"
code --install-extension "ivanhofer.git-assistant" # Git (submodule) assistant # I don't know if I want this one yet. 

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

