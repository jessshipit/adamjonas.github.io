---
layout: post
title: "Exploring Ruby Gems"
date: 2012-10-11 19:37
comments: true
categories: gems
---

Tips pulled from:

[RailsCast - Exploring Ruby Gems](http://railscasts.com/episodes/384-exploring-rubygems) and [Finding Valuable Gems](http://www.confreaks.com/videos/900-railsconf2012-how-to-find-valuable-gems) with Nathan Bibler from Envy Labs.

Ruby tool

- Look at popularity

Look at github repo directly

- number of commits
- checkout issue tracker
	- number of open issues vs. closed issues

Search for the product on Rubygems.org

- look for stable release
- look at runtime dependencies--> there are lots of moving parts breaks often happen because of rails dependencies
- use the gem file to control the version

Documentation

- look at the project wiki
- should also look at the rdocs

Source Code

- can take a look at source code on github
- can really dig in if you clone
- use the cloc app lib to judge the number of lines of ruby code (brew install cloc if I don't have it)
- Look under the lib dir with the file that matches the gem name-- e.g. devise.rb-- usually provides a structure of the app and its dependencies
- Next stop, a railtie file or rails.rb