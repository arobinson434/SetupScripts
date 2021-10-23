#!/bin/bash

export DISTRO_DIR=`dirname $BASH_SOURCE[0]`

## Build Common Package List
while read pkg
    do PACKAGE_LIST="${PACKAGE_LIST}${pkg} "
done < $DISTRO_DIR/packagelist.txt

function install_packages() {
    sudo yum install -y $@
}

