---
layout: post
title: "memories and holiday"
date: 2013-10-22 10:52
comments: true
categories: 
---

###Generate a new secret token  
  - I copied over app with a foundation built in. Can't of course copy over the secret token. `rake secret` will generate the new token [via](http://www.jamesbadger.ca/2012/12/18/generate-new-secret-token/).

###Geolocation
  - [used enabled geo location in the app](http://stackoverflow.com/questions/2248404/about-geolocation-in-html-5)
  - the method [found here](http://diveintohtml5.info/geolocation.html), which should be the canonical source didn't work for me.

###Print styling
  - needed to remove the deafult media='screen' in order to load these styles via [this post](http://lawrencenaman.com/optimisation/print-media-queries-not-working/)
  - in application.rb needed to include `config.assets.precompile += ['print_wishlist.css']` so that it is precompiled separately. Though it was written in sass it needed the print_wishlist.css.sass extensions as sass isn't recognized in the app.rb as it expect the file after compilation rather than before [via](http://jalada.co.uk/2012/01/23/adding-files-to-config-assets-precompile-in-rails-3-1.html).


