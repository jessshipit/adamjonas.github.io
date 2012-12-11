---
layout: post
title: "script bootstrap"
date: 2012-12-10 11:16
comments: true
categories: bootstrap_script
---

###Zach Holman's Slides on [setting up a boostrap script](http://zachholman.com/talk/ruby-patterns)

- dependency check
  - is MySQL installed
  - is redis running
- bundler
  - bundle install \
    --binstubs \
    --local \
    --path=vendor/gems \
    --without=production
- db creation
  - rake db:create
- db migration
  - rake db:migrate
- db seeding
  - [script/replicate-repo](https://github.com/rtomayko/replicate)
- static page compilation
  - 404,500
- language compilation
  - python, c, erlang

###Check to see if we need bundle install
```ruby Need to bundle install?
md5       << File.read('Gemfile')
checksum  = md5.hexdigest
installed = File.read('.bundle/checksum').strip
```

- [Some examples](https://github.com/holman/hopper/blob/master/script/bootstrap)

###Using Foreman
- [An Intro](http://blog.daviddollar.org/2011/05/06/introducing-foreman.html)

###Permission Issues

- Once we changed the server script and we pushed, the permission issue went away. [This is how we changed the permission](http://shalinjain.com/index.php/2009/05/27/scriptserver-permission-denied-ruby-on-rails-error) in the first place.

- [Git Script To Show Largest Pack Objects](http://stubbisms.wordpress.com/2009/07/10/git-script-to-show-largest-pack-objects-and-trim-your-waist-line/)