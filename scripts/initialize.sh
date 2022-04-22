#!/bin/bash
set -e



cd $HYBRIS_BIN_DIR/platform
. ./setantenv.sh
#generate config folder

ant initialize

echo update Password
ant executesql -Dsql.file=$HYBRIS_HOME_DIR/sql/users.sql