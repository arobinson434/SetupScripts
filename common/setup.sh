#!/bin/bash

export COMMON_DIR=`dirname $BASH_SOURCE[0]`

## Build Common Package List
export PACKAGE_LIST=""
while read pkg
    do PACKAGE_LIST="${PACKAGE_LIST}${pkg} "
done < $COMMON_DIR/packagelist.txt

## Write Configs
for f in $COMMON_DIR/conf_writers/*.sh; do ./$f; done

## Copy Util Scripts
mkdir -p ~/.util_scripts/
cp -r $COMMON_DIR/util_scripts/ ~/.util_scripts/
if ! grep -xq "export PATH=$PATH:~/.util_scripts/" ~/.bashrc ; then
    echo "export PATH=$PATH:~/.util_scripts/" >> ~/.bashrc
fi

## Add Aliases if not already added
function add_alias() {
    if ! grep -xq "alias $1=\"$2\"" ~/.bashrc ; then
        echo "alias $1=\"$2\"" >> ~/.bashrc
    fi
}

add_alias gs "git status"
add_alias gd "git diff"
add_alias gs "git diff --cached"

