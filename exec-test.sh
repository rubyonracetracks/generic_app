#!/bin/bash
set -e

DIR_NAME=$1
APP_NAME=$2
EMAIL=$3

bash exec-main.sh $DIR_NAME $APP_NAME $EMAIL

num_orig_email=`grep -or 'somebody@rubyonracetracks.com' $PWD/new_apps/$DIR_NAME/* | wc -l`
if [ $num_orig_email -gt 0 ];
then
  echo 'FAIL: at least one instance of somebody@rubyonracetracks.com remains'
  exit 1
fi

orig_title='Generic App Template'
num_orig_title=`grep -or "$orig_title" $PWD/new_apps/$DIR_NAME/* | wc -l`
if [ $num_orig_title -gt 0 ];
then
  echo "FAIL: at least one instance of $orig_title remains"
  exit 1
fi

if test -f "$PWD/new_apps/$DIR_NAME/.travis.yml"; then
  echo 'FAIL: .travis.yml file not removed'
  exit 1
fi

EXP_LINE1='<!--- BEGIN: badges --->'
EXP_LINE2='<!--- END: badges --->'
ACTUAL_LINE1=`sed -n '1p' "$PWD/new_apps/$DIR_NAME/README.md"`
ACTUAL_LINE2=`sed -n '2p' "$PWD/new_apps/$DIR_NAME/README.md"`

if [ "$EXP_LINE1" != "$ACTUAL_LINE1" ];
then
  echo "FAIL: first line in README.md is not $EXP_LINE1"
  exit 1
fi

if [ "$EXP_LINE2" != "$ACTUAL_LINE2" ];
then
  echo "FAIL: second line in README.md is not $EXP_LINE2"
  exit 1
fi
