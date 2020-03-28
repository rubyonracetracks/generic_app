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
fi


# Add test to confirm that the badges section is empty
