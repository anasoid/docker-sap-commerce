#!/bin/bash
set -e

prepare.sh
build.sh
cd $HYBRIS_BIN_DIR/platform
. ./setantenv.sh
ant executesql -Dsql.file=$HYBRIS_HOME_DIR/scripts/sql/licences.sql
$HYBRIS_BIN_DIR/platform/hybris debug