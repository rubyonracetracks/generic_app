#!/bin/bash
set -e

DATE=`date +%Y%m%d-%H%M%S-%3N`

APP_NAME='tmp1'

mkdir -p log
rm -rf new_apps/$APP_NAME
bash exec-test.sh $APP_NAME 'Generic App 1' '007@railstutorial.org' 2>&1 | tee log/test.txt
