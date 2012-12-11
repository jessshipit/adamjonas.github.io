---
layout: post
title: "Backbone.js Intro"
date: 2012-12-07 14:57
comments: true
categories: backbone
---

###Intro with [Nick Gauthier](http://www.youtube.com/watch?v=PqtYcHyyWJA)

- 7min 3seconds

- Backbone is a library, not a framework
  - it is injectable, like Jquery

- Ember is much larger and does more for you, but in backbone you call the shots

- Router
  - Bind urls to actions with hashbang route or pushstate route
  - if you have a route that it recognizes it triggers your code
  - extend backbone default router
  - looks at a route and triggers an action -> like Rails

- Views
  - When you instantiate a view, you create a new DOM element
  - The view's job is to listen to events, like jQuery to trigger actions
  - 

```javascript Listens for a click...
  \\code
  events: {
  "click .pet": "woof"
},
\\more code
```

