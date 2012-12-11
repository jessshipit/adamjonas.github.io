---
layout: post
title: "advanced sinatra"
date: 2012-12-10 13:14
comments: true
categories: sinatra
---

###Sinatra
- Sinatra is a DSL for creating a web

- Sinatra is library, not a framework (rails is a framework)

- [difference between lib and framework](http://stackoverflow.com/questions/148747/what-is-the-difference-between-a-framework-and-a-library)

- [inversion of control](http://martinfowler.com/bliki/InversionOfControl.html) by Martin Fowler

  - Sinatra supports inline templates
  - variables are passed in via @instance variables
  - Filters
  - Helpers: takes a block and then anything defined are available in the templates
  - Configuration: looks at the rack env variable and executes code based on the env
  - [cache docs](http://www.mnot.net/cache_docs/)
  - By default don't have sessions. Need to config sessions.
  - Testing -> a lot of the tests that come with rails aren't in sinatra
    - test with rack-test
  
  - classic app ->
    - all the routes are in one file, it is straight Ruby code
  - Modular app -> 
    - don't want to pollute the Object namespace
    - combinging multiple Sinatra apps in a single process
    - use Sinatra app as middleware

  - Supports extensions
    - could be helpers, routes, configurations pacakged into a Gem and used on other apps
  
  - Registered
    - when the app is registered is has a method (`def self.registered(app)`) that allows config settings
  
  - extensions
    - [writing extensions](http://www.sinatrarb.com/extensions.html)
    - [using extensions](http://www.sinatrarb.com/extensions-wild.html)

###Sinatra vs. Rails
- when to use Sinatra...
  - Thick client web applications for performance or heavily visualizations
    - majority of the logic is on the client, not on the server
    - sinatra serves things really fast
  
  - API servers for iOS/Android/Javascript Apps
  - HTML5 Mobile Apps ([jq touch](http://www.jqtouch.com/) or jquery mobile)

###Rack
- [Hello Rack](http://m.onkey.org/ruby-on-rack-1-hello-rack)

###Gems
- [Middleman Gem](http://middlemanapp.com/getting-started/welcome/)
- Sprockets- pretty much the asset pipeline

###Sinatra integrated into Rails
- it is all Rack under the hood so you use `mount` in the route file and then all the urls defined in the sinatra app are available in the rails app