#!/bin/bash
set -e

LOCK_FILE_PREPARE=/home/hybris/prepared
if ! [ -f "$LOCK_FILE_PREPARE" ]; then
    if [ -d "$HYBRIS_CONFIG_DIR" ]; then
        echo "Error config folder already created $HYBRIS_CONFIG_DIR"
        exit 1
    else
        echo "Config folder not present : $HYBRIS_CONFIG_DIR "
    fi
    
    
    #Copy custom folder
    echo START copy hybris
    cp -rf  $HYBRIS_SOURCE_DIR/. $HYBRIS_HOME_DIR
    
    
    
    echo START prepare cx-custom
    cp -rf $HYBRIS_HOME_DIR/installer/recipes/cx/. $HYBRIS_HOME_DIR/installer/recipes/cx-custom/
    sed -i "s/extensions {/extensions {\n extName 'spartacussampledata'/" $HYBRIS_HOME_DIR/installer/recipes/cx-custom/build.gradle
    
    echo START download spartacus
    download-spa.sh
    
    echo START install recipe cx-custom
    $HYBRIS_HOME_DIR/installer/install.sh -r cx-custom -A initAdminPassword=nimda -A installed.tenants=
    
    echo START custom
    cp -vrf  $CUSTOM_FOLDER/. $HYBRIS_HOME_DIR/
    
    echo START custom local.properties
    echo "" >> $HYBRIS_CONFIG_DIR/local.properties
    cat $HYBRIS_CONFIG_DIR/custom.properties >> $HYBRIS_CONFIG_DIR/local.properties
    
    cd $HYBRIS_BIN_DIR/platform
    . ./setantenv.sh
    #generate config folder
    echo -ne '\n' | ant -p
    
    touch $LOCK_FILE_PREPARE
else
    echo "Skipe Prepare, already prepared "
    
fi
