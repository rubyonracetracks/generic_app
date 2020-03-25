#!/bin/bash
set -e

DIR_NAME=$1
APP_NAME=$2
EMAIL=$3

mkdir -p $PWD/new_apps

DIR_APP=$PWD/new_apps/$DIR_NAME

URL=`cat $PWD/URL-APP.txt`

git clone $URL $DIR_APP

# Update the email address
STR1='somebody@rubyonracetracks.com'
STR2=$EMAIL
find $DIR_APP -type f -exec sed -i "s|$STR1|$STR2|g" {} +

# Update the title of the app
STR1='Generic App Template'
STR2=$APP_NAME
find $DIR_APP -type f -exec sed -i "s|$STR1|$STR2|g" {} +

echo '##############################'
echo 'Your new app has been created!'
echo ''
echo 'It is located at:'
echo "$DIR_APP"
echo ''
