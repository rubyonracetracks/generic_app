[![Build Status](https://travis-ci.com/rubyonracetracks/generic_app.svg?branch=master)](https://travis-ci.com/rubyonracetracks/generic_app)

# Generic App

Welcome to [Generic App](https://www.genericapp.net/), the #1 most comprehensive Rails app generator!  If you're not exactly a Generic App user, then you're not exactly viable at Startup Weekend or 24-hour web site challenges.

## Prerequisites
You need Docker and Docker-Compose on your host OS.  However, you do NOT Ruby in your host OS.

## Usage
* Download the source code of this repository.
* In your terminal, use the "cd" command to enter the root directory of this app.
* Enter the command "bash main.sh".  This starts Generic App.
* When prompted, enter the directory name, app title, and email address you wish to use in your new Rails app.  (The email address is used as the point of origin for confirmation emails sent to users and as the point of contact shown in the app itself.)
* Your new app will be downloaded into the new_apps directory, and it will be customized with the new directory name, app title, and email address that you provided.
* Use the "cd" command to enter the root directory of your new app.
* Then enter the command "bash build.sh; bash server.sh".  The build.sh script automatically sets up your new app.  When it is finished, the server.sh script activates the Rails server.  You will be able to view your new app at http://localhost:3000 and the MailCatcher interface at http://localhost:1080.
