#!/bin/bash

export COMMON_DIR=`dirname $BASH_SOURCE[0]`

## Build Common Package List
export PACKAGE_LIST=""
while read pkg
    do PACKAGE_LIST="${PACKAGE_LIST}${pkg} "
done < $COMMON_DIR/packagelist.txt

## Write Configs
for f in $COMMON_DIR/conf_writers/*.sh; do $f; done

## Copy Util Scripts
mkdir -p ~/.util_scripts/
for f in $COMMON_DIR/util_scripts/*/; do
    cp -r $f ~/.util_scripts/
    if ! grep -xq "export PATH=$PATH:~/.util_scripts/`basename $f`/" ~/.bashrc ; then
        echo "export PATH=$PATH:~/.util_scripts/`basename $f`/" >> ~/.bashrc
    fi
done

## Add Aliases if not already added
function add_alias() {
    if ! grep -xq "alias $1=\"$2\"" ~/.bashrc ; then
        echo "alias $1=\"$2\"" >> ~/.bashrc
    fi
}

add_alias gs  "git status"
add_alias gd  "git diff"
add_alias gdc "git diff --cached"
add_alias vi  "vim"

## Setup Prompt
ps1_str="export PS1=\"\u@\[\033[01;32m\]\h\[\e[m\]:\[\033[01;34m\]\W\[\e[m\]\\$ \""
if ! grep -xq $ps1_str ~/.bashrc; then
    echo $ps1_str >> ~/.bashrc
fi

