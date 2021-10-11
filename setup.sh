#!/bin/bash

export BASE_DIR=`dirname $BASH_SOURCE[0]`

source $BASE_DIR/common/setup.sh

if  [[ -f "/etc/debian_version" ]]; then
    source $BASE_DIR/debian/setup.sh
elif [[ -f "/etc/redhat-release" ]]; then
    source $BASE_DIR/redhat/setup.sh
fi

install_packages $PACKAGE_LIST

## Setup Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo | vim -c PlugInstall -c quitall

