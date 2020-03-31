#!/bin/bash

echo '***********************'
echo 'Welcome to Generic App!'
echo 'This is a script for creating a new Rails app!'
echo ''
echo 'Enter the name of the directory you wish to use for your new app.'
echo 'If you enter a blank, a directory name will be chosen for you.'
read DIR_NAME

if [ -z "$DIR_NAME" ]; then
  DATE=`date +%Y%m%d-%H%M%S-%3N`
  DIR_NAME="genr-$DATE"
fi

echo ''
echo 'Enter the title of your new app.'
echo 'If you enter a blank, an app title will be chosen for you.'
read APP_TITLE

if [ -z "$APP_TITLE" ]; then
  APP_TITLE="Not Sure"
fi

echo '-------------------'
echo 'App directory name:'
echo "$DIR_NAME"
echo ''
echo '-------------------'
echo 'App title:'
echo "$APP_TITLE"
echo ''

echo ''
echo 'Press Enter to continue.'
read CONT

mkdir -p log
sh exec-main.sh $DIR_NAME $APP_TITLE | tee log/log-$DATE.txt
