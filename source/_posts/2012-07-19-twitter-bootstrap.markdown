---
layout: post
title: "Twitter Bootstrap"
date: 2012-07-19 12:29
comments: true
categories: bootstrap rails
---

Rails Cast for [twitter bootstrap:](http://railscasts.com/episodes/328-twitter-bootstrap-basics)


LESS is a CSS precessor
:  to get LESS working with rails you need the help of some gems


I can download the source [here](https://github.com/seyhunak/twitter-bootstrap-rails). This is the preferred code not, [this one](https://github.com/twitter/bootstrap/).


Change Gemfile
```
    gem 'therubyracer', :platform => :ruby
    gem 'twitter-bootstrap-rails'
    gem 'chosen-rails'
```
Install Twitter Bootstrap
```
    bundle
    rails g bootstrap:install
    rails g bootstrap:layout application fixed
``` 

A file that was generated is: app/assets/stylesheets/bootstrap_and_override.css.less
This is where I would do the bulk of the customization
 - including if padding is needed between the body and the nav bar...

``` ruby For some padding at the top
@import "twitter/bootstrap/bootstrap";
body { padding-top: 60px; }
@import "twitter/bootstrap/responsive";
```

Layout fixed makes it 940px and fluid makes it full screen. Both are responsive though.

###When I generate new resources###
```
rails g scaffold Post title:string description:text
rake db:migrate
rails g bootstrap:themed Posts
```
Without the 3rd line it looks terrible so remember to run it!

Further reading is [here.](http://rubysource.com/twitter-bootstrap-less-and-sass-understanding-your-options-for-rails-3-1/)

When I'm ready for it, Bates does a follow up rails cast on more [advanced twitter bootstrap](http://railscasts.com/episodes/329-more-on-twitter-bootstrap).

NOTE: We went over twitter bootstrap in lecture 6 of ROR spring