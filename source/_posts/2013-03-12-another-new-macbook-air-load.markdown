---
layout: post
title: "Another new MacBook Air load"
date: 2013-03-12 13:34
comments: true
categories: mac
---

###RBENV
  - ran into a pow issue not recognizing my gemset -> similar [issue to the one here](https://github.com/37signals/pow/issues/202) and [here](http://thelucid.com/2012/10/11/pow-meet-rbenv/).
    - it ended up because I had installed rbenv with homebrew which meant it was in the opts directory. What a pain.
  - the rbenv install went pretty smoothly save for that. Used [this as a guide](http://www.bounga.org/ruby/2012/02/06/pow-using-rbenv/.

###PSQL
  - the install went much smoother this time. I used this [ref](http://stackoverflow.com/questions/12028037/postgres-app-could-not-start-on-port-5432/13847738#13847738) when I ran into problems.

  - [this helped](http://stackoverflow.com/questions/6867401/postgres-postgresql-fatal-database-ew-dev-does-not-exist) on my old air... the app installed without a hitch, but I was missing the creating of the databases.
  - when the psql app wasn't active

    ♕ psql
    psql: could not connect to server: No such file or directory
      Is the server running locally and accepting
      connections on Unix domain socket "/var/pgsql_socket/.s.PGSQL.5432"?

  - after turning it on, I got this

    ♕ psql
    psql: FATAL:  database "Ajonas" does not exist

  - the PATH clearly isn't right, but by adding `rake db:create:all` I got the app to bootup.

###Bundler and Octopress reinstall
  - bundler wasn't recognized because of the different ruby version. Installed the new version and `gem install bundler` as [advised](http://stackoverflow.com/questions/7483515/rake-aborted-no-such-file-to-load-bundler-setup-rails-3-1.