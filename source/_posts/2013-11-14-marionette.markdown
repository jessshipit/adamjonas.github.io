---
layout: post
title: "Marionette"
date: 2013-11-14 11:54
comments: true
categories: 
---

###Backbone.Model And Backbone.Collection
  - **model** in Backbone represent a singular entity — a record in a database if you will.
  - **collections** in Backbone are essentially just a collection of models
    - e.g. collections are the results of a query where the results consists of a number of records [models]

###Backbone.View
  - Is the HTML representation of the model
  - A view handles two duties fundamentally:
    - Listen to events thrown by the DOM and models/collections.
    - Represent the application’s state and data model to the user.
  - Said another way, the primary responsibility of a view is to coordinate interactions between the end user and the application’s services.
  - In spite of their importance and having their fingers in all the pies of Backbone, views are not in control. They respond to changes in the application state in order to render the right HTML at the right time. They also facilitate changing the state by calling other objects that can change the state, but only on behalf of the user who initiates a state change by interacting with the DOM. Views are effectively the middle-man of a Backbone app. 

###Backbone.Events
  - The primary responsibility of Backbone.Events is to decouple the knowledge of state changes from the response to those state changes, through the use of the observer pattern.
  - Backbone.Events is the little powerhouse that facilitates nearly every aspect of a Backbone application. This is the one piece of Backbone that is found in every other piece of Backbone. Every time you call “bind” or “trigger” on any Backbone object, you’re using Backbone.Events. [From](http://lostechies.com/derickbailey/2011/12/27/the-responsibilities-of-the-various-pieces-of-backbone-js/)

###App.vent
  - [appvent-event-aggregator](https://github.com/marionettejs/backbone.marionette/blob/master/docs/marionette.application.md#appvent-event-aggregator)
    - from the [wreqr](https://github.com/marionettejs/backbone.wreqr)
    - basic example is `MyApp.vent.on("foo", function(){ alert("bar"); });` triggered by `MyApp.vent.trigger("foo");`
  - one can also pass along an object or a string as a second parameter such as `App.vent.trigger('user_loaded', true)` or `App.vent.trigger('user_loaded', false)` that means that the listener can adjust accordingly (i.e. `App.vent.once('user_loaded', (user_loaded) -> $('.change-scene').show() if user_loaded ))`

