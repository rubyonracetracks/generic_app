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
  APP_TITLE='Not Sure'
fi

echo ''
echo 'Enter the email address you wish to use as the point of contact in your app.'
echo 'If you enter a blank, an email address will be chosen for you.'
read EMAIL

if [ -z "$EMAIL" ]; then
  EMAIL='blackmailer@zoeysballoon.com'
fi

echo '-------------------'
echo 'App directory name:'
echo "$DIR_NAME"
echo ''
echo '-------------------'
echo 'App title:'
echo "$APP_TITLE"
echo ''
echo '--------------'
echo 'Email address:'
echo "$EMAIL"

echo ''
echo 'Press Enter to continue.'
read CONT

mkdir -p log
sh exec-main.sh $DIR_NAME $APP_TITLE $EMAIL | tee log/log-$DATE.txt
