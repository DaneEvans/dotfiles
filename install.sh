
LOG_FILE="/workspaces/.dotfiles/log.txt"
mkdir /workspaces/.dotfiles

echo "dotfile loaded" > LOG_FILE

## Set an environment variable for user email 
CMFIVE_USER_EMAIL=dane@2pisoftware.com
export CMFIVE_USER_EMAIL


## Setup GHCLI 
# uses GITHUB_TOKEN 
# dump the existing token, it has no rights 
export GITHUB_TOKEN=
# Copy in the one from the secrets. note, this is only valid for this script
export GITHUB_TOKEN=${PERSONAL_TOKEN}
gh cs list


## Setup the ssh key
eval "$(ssh-agent -s)"
ssh-add - <<< "${PERSONAL_SSH_KEY}"

touch ~/.ssh/id_rsa.pub
if [ -f "~/.ssh/id_rsa.pub" ]
then 
    printf "%s" "${PERSONAL_SSH_KEY}" > "~/.ssh/id_rsa.pub"
fi

if ! grep github.com ~/.ssh/known_hosts > /dev/null
then
	ssh-keyscan github.com >> $HOME/.ssh/known_hosts
fi


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

