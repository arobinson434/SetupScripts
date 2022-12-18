#!/bin/bash

export BASE_DIR=`dirname $BASH_SOURCE[0]`

source $BASE_DIR/common/setup.sh

if  [[ -f "/etc/debian_version" ]]; then
    source $BASE_DIR/debian/setup.sh
elif [[ -f "/etc/redhat-release" ]]; then
    source $BASE_DIR/redhat/setup.sh
fi

install_packages $PACKAGE_LIST

#################
## Setup Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo | vim -c PlugInstall -c quitall

############
## Setup Git
if [[ -n "$GIT_USER" ]]; then
    git config --global user.name "$GIT_USER"
fi

if [[ -n "$GIT_EMAIL" ]]; then
    git config --global user.email "$GIT_EMAIL"
fi

######################
## Setup Diff-So-Fancy
sudo git clone https://github.com/so-fancy/diff-so-fancy.git /opt/diff-so-fancy/
sudo ln -s /opt/diff-so-fancy/diff-so-fancy /usr/bin/diff-so-fancy

git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false

git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"
git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.func       "146 bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

##################
## Closing Message
echo "Setup Complete!"
echo "  Run \`. ~/.bashrc\` to source new settings"

