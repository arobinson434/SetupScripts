#!/bin/bash

###################################
## Add Aliases if not already added
function add_alias() {
    if ! grep -xq "alias $1=\"$2\"" ~/.bashrc ; then
        echo "alias $1=\"$2\"" >> ~/.bashrc
    fi
}

#################
## Setup Vim Plug
function setup_vim_plug() {
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo | vim -c PlugInstall -c quitall
}

############
## Setup Git
function setup_git() {
    if [[ -n "$GIT_USER" ]]; then
        git config --global user.name "$GIT_USER"
    fi

    if [[ -n "$GIT_EMAIL" ]]; then
        git config --global user.email "$GIT_EMAIL"
    fi

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
}

function help() {
    echo -e "setupScripts"
    echo -e "\tThis utility is meant to apply personal settings, scripts and"
    echo -e "\ttools on a fresh Linux install."
    echo -e ""
    echo -e "\tTo setup git, make sure to have the GIT_USER and GIT_EMAIL env"
    echo -e "\tvars set appropriately."
}

