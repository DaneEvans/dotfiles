cd '/workspaces/'${RepositoryName}

LOG_FILE=${PWD}'/.dotfiles/log.txt'

if [ ! -d $PWD'/.dotfiles' ]; then 
    mkdir $PWD'/.dotfiles'
fi

date +"%FORMAT_STRING"

echo "Dotfile loaded at $(date +"%H:%M:%SS, %d_%m_%Y")" > $LOG_FILE

# add .dotfiles folder to the gitignore
if ! grep -Fxq '.dotfiles/' $PWD'/.gitignore'
then
    echo "" >> $PWD'/.gitignore'
    echo "#Dotfiles " >> $PWD'/.gitignore'
    echo '.dotfiles/' >> $PWD'/.gitignore'
    echo "Added lines to .gitignore" >> $LOG_FILE
fi
echo "Done .gitignore" >> $LOG_FILE


## Set an environment variable for user email 
USER_EMAIL=dane@goneepic.com
export USER_EMAIL
echo "Set Your email" >> $LOG_FILE


# ## Setup GHCLI 
# # uses GITHUB_TOKEN 
# # dump the existing token, it has no rights 
# export GITHUB_TOKEN=
# # Copy in the one from the secrets. note, this is only valid for this script
# export GITHUB_TOKEN=${PERSONAL_TOKEN}
# gh cs list
# ## gets us this list, but doesn't persist ... 
# echo "Got a codespaces list: " >> $LOG_FILE
# gh cs list >> $LOG_FILE
# echo "... Done"


## Setup the ssh key to clone any private repos that we need. 
echo "Setting up SSH keys" >> $LOG_FILE

SSH_DIR="/home/vscode/.ssh"
if [ ! -d $SSH_DIR ]; then
    mkdir $SSH_DIR
fi

if [ ! -f $SSH_DIR"/id_rsa" ]
then 
    touch '/home/vscode/.ssh/id_rsa'
fi
printf "%s" "${PERSONAL_SSH_KEY}" > $SSH_DIR"/id_rsa"
chmod 400 $SSH_DIR"/id_rsa" 
echo "... Done"

echo "adding Github to hosts" >> $LOG_FILE
## ad github to hosts to prevent a warning 
if ! grep github.com $SSH_DIR/known_hosts > /dev/null
then
	ssh-keyscan github.com >> $SSH_DIR/known_hosts
fi
echo "... Done"


# echo "Cloning a private repo " >> $LOG_FILE

# # test clone a private repo 
# git clone git@github.com:2pisoftware/artifax-module-bundle.git $PWD'/artifax-module-bundle' >> $LOG_FILE
# echo "... Done"


echo "Loading Personal Extensions: "
# Add additional extensions 
code --install-extension "Gruntfuggly.todo-tree" 
code --install-extension "oderwat.indent-rainbow"
code --install-extension "mhutchie.git-graph"
code --install-extension "JozefChmelar.compare" 
code --install-extension "DavidAnson.vscode-markdownlint" 
code --install-extension "waderyan.gitblame"


#code --install-extension "eamodio.gitlens"
code --install-extension "mutantdino.resourcemonitor"

code --install-extenxion "github.vscode-github-actions"
#code --install-extension "ivanhofer.git-assistant" # Git (submodule) assistant # Seems to be ver slow, and not sure it offers value 
echo "... Done"


exit 0

