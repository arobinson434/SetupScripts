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
mkdir ~/.util_scripts/
cp -r $COMMON_DIR/util_scripts/ ~/.util_scripts/
