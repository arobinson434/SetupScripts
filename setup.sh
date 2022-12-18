#!/bin/bash

export BASE_DIR=`dirname $BASH_SOURCE[0]`

if [[ $1 == "-h" || $1 == "--help" ]]; then
    source $BASE_DIR/common/functions.sh
    help
    exit 0
fi

source $BASE_DIR/common/setup.sh

if   [[ -f "/etc/debian_version" ]]; then
    source $BASE_DIR/debian/setup.sh
elif [[ -f "/etc/redhat-release" ]]; then
    source $BASE_DIR/redhat/setup.sh
fi

install_packages $PACKAGE_LIST
setup_vim_plug
setup_git

##################
## Closing Message
echo "Setup Complete!"
echo "  Run \`. ~/.bashrc\` to source new settings"

