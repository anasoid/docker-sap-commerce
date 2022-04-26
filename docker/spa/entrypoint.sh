#!/bin/bash
set -e

sed -i "s/localhost:9002/$BASE_URL/" ./spartacus/src/app/spartacus/spartacus-configuration.module.ts

cd spartacus

ng serve --host=0.0.0.0 