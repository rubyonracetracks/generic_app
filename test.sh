#!/bin/bash
set -e

DATE=`date +%Y%m%d-%H%M%S-%3N`

APP_NAME="tmp-$DATE"

mkdir -p log
bash exec-test.sh $APP_NAME 'Generic App 1' '007@railstutorial.org' 2>&1 | tee log/test.txt
