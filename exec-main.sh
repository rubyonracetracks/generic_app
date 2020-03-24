#!/bin/bash
set -e

DIR_NAME=$1
APP_NAME=$2
EMAIL=$3

mkdir -p $PWD/new_apps

DIR_APP=$PWD/new_apps/$DIR_NAME

URL=`cat $PWD/URL-APP.txt`

git clone $URL $DIR_APP

replace_str_in_file () {
  STR1=$1
  STR2=$2
  FILENAME=$3
  sed -i.bak "s|$STR1|$STR2|g" $FILENAME
  rm $FILENAME.bak
}

# Update email address
replace_str_in_file 'somebody@rubyonracetracks.com' $EMAIL $DIR_APP/app/views/static_pages/contact.html.erb
replace_str_in_file 'somebody@rubyonracetracks.com' $EMAIL $DIR_APP/config/initializers/devise.rb
replace_str_in_file 'somebody@rubyonracetracks.com' $EMAIL $DIR_APP/test/integration/static_pages_test.rb

# docker run -i -t --rm -v ${PWD}:/home/winner/neutrino rubyonracetracks/rails_neutrino_5 /home/winner/neutrino/build-rails $APP_NAME $TOGGLE_OUTLINE

echo '##########################################'
echo 'The new app has been created from scratch!'
echo ''
echo 'It is located at:'
echo "$DIR_APP"
echo ''
