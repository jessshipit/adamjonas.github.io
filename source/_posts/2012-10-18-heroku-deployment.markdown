---
layout: post
title: "heroku deployment"
date: 2012-10-18 11:26
comments: true
categories: heroku
---
```
# Initialize the repository
$ git init

# Add new files to the repo
$ git add .

# See the status
$ git status

# Commit the changes with the commit message "testing"
$ git commit -m "testing"

# Create a new Heroku app
$ heroku create

# Rename the Heroku app
# Example: $ heroku rename tom-messages
$ heroku rename <name of url>

# Add a (free) PostgreSQL database to your app
$ heroku addons:add heroku-postgresql

# See the details of your new database
$ heroku pg:info

# Promote your new database to the "DATABASE_URL" global constant
# Example: $ heroku pg:promote HEROKU_POSTGRESQL_BRONZE_URL
$ heroku pg:promote <YOUR_HEROKU_URL>

# Push your repo to Heroku, start your app
$ git push heroku master

# Open the app in your browser
$ heroku open

# See your app's log, keep the stream open by using "--tail"
$ heroku logs --tail

# Set up the database for first use, running "DataMapper.auto_migrate!"
# Example: $ http://ajonas.herokuapp.com/reset
$ http://<project-name>.herokuapp.com/reset

# See your messages!
# Example: $ http://ajonas.herokuapp.com
$ http://<project-name>-messages.herokuapp.com
```