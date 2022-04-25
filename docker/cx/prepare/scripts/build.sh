#!/bin/bash
set -e


LOCK_FILE_BUILD=/home/hybris/build

if ! [ -f "$LOCK_FILE_BUILD" ]; then
    cd $HYBRIS_BIN_DIR/platform
    . ./setantenv.sh
    ant clean
    ant all
    touch $LOCK_FILE_BUILD
else
    echo "Skipe build, already builded "
fi
