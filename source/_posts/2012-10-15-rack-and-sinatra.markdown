---
layout: post
title: "Rack and Sinatra"
date: 2012-10-15 13:11
comments: true
categories: rack sinatra
---

[Tom Black](https://twitter.com/blacktm)

###Programmer of the day###
  - John Carmack- creator of quake, doom
    - Programming is not a zero-sum game. Teaching something to a fellow programmer doesn't take it away from you. I'm happy to share what I can, because I'm in it for the love of programming.

*Think about solutions not syntax*

###Rack 
>A modular web server interface

  - Rack App
    - a ruby object that responses to a call method, taking a single hash parameter and returning an array which contains the response status code, response headers

>Rack applications are objects that respond to call. They must return a "triplet". A triplet contains the status code, headers, and body. Here's an example class that shows "hello world."

    class HelloWorld
      def response
        [200, {}, 'Hello World']
      end
    end

  - [rack from the beginning](http://broadcastingadam.com/2012/07/rack_from_the_beginning/)

  - Middleware
    - stuff stuck in the middle of a process

rack sits in the middle of your app and webserver
  
  - You have to instantiate the Rack application (oh duh)[http://stackoverflow.com/questions/15572392/why-does-rails-generate-a-config-ru-that-runs-a-class-not-an-object]

    root :to => SimpleRackApplication.new

###Sinatra###
  - is a dsl for quickly creating web applications in Ruby with minimal effort.

Is just a facade 
webserver -> middleware -> sinatra -> your app

*Sinatra is closer to rack's older brother than rails is to sinatra.*

Rails is a full-stack web application framework.

[Project page](http://www.blacktm.com/docs/talks/building_web_apps_with_rack_and_sinatra)


###