#!/bin/bash
set -e



cd $HYBRIS_BIN_DIR/platform
. ./setantenv.sh
#generate config folder

ant initialize

echo update Password
ant executesql -Dsql.file=$HYBRIS_HOME_DIR/scripts/sql/users.sql
ant importImpex -Dresource=$HYBRIS_HOME_DIR/scripts/impex/spa.impex