---
layout: post
title: "Backbone beginner's basics"
date: 2013-11-19 17:02
comments: true
categories: 
---


###Validations
  This is a neat little [validation plugin](https://github.com/thedersen/backbone.validation) that passes back error objects.

###Form serialization
  - Used [syphon](https://github.com/derickbailey/backbone.syphon/blob/master/apidoc.md) built by Derick Bailey.

###onBeforeRender versus onRender
  - Was trying to call a function `onBeforeRender` but it wouldn't execute until it was changed to `onRender`.


###Resources
  - code school backbone.js class
  - watch this for [explanation for backbone.js to marionette](http://vimeo.com/59431658)

###Google Analytics on Backbone
  - this was a [good guide](https://gist.github.com/daveaugustine/1771986) though it did not include the fact that 
  - used `universal.js` so had to use the `ga('create', 'UA-XXXX-Y', 'auto');` syntax
