#!/bin/bash
set -e

DIR_NAME=$1
APP_TITLE=$2
EMAIL=$3

mkdir -p $PWD/new_apps

DIR_APP=$PWD/new_apps/$DIR_NAME

URL=`cat $PWD/URL-APP.txt`

git clone $URL $DIR_APP

wait

# Necessary to avoid accidental commits to the wrong repository
cd $DIR_APP && git remote remove origin

# Update the email address
STR1='somebody@rubyonracetracks.com'
STR2=$EMAIL
find $DIR_APP -type f -exec sed -i "s|$STR1|$STR2|g" {} +

# Update the title of the app
STR1='Generic App Template'
STR2=$APP_TITLE
find $DIR_APP -type f -exec sed -i "s|$STR1|$STR2|g" {} +

# Removing .travis.yml
rm $DIR_APP/.travis.yml

# Removing the badges
# Source:
# https://stackoverflow.com/questions/5071901/removing-lines-between-two-patterns-not-inclusive-with-sed
STR1='<!--- BEGIN: badges --->'
STR2='<!--- END: badges --->'
sed -i -n "/$STR1/{p; :a; N; /$STR2/!ba; s/.*\n//}; p" $DIR_APP/README.md

echo '##############################'
echo 'Your new app has been created!'
echo ''
echo 'It is located at:'
echo "$DIR_APP"
echo ''
echo 'Enter the following commands:'
echo "cd $DIR_APP"
echo 'git add .'
echo 'git commit -m "Customized by Generic App"'
