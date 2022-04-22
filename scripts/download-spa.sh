#!/bin/bash
set -e

#https://sap.github.io/spartacus-docs/installing-sap-commerce-cloud-2105/#step-1-download-unzip-and-create-the-new-recipe

wget ${SPA_DOWNLOAD_URL} -O /tmp/spartacussampledata.zip

mkdir -p ${HYBRIS_BIN_DIR}/custom/spartacussampledata 
cd ${HYBRIS_BIN_DIR}/custom/spartacussampledata 
jar -xvf /tmp/spartacussampledata.zip
