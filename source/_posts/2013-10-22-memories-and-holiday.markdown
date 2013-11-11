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

###local storage versus cookies
  - **client versus server** -> Cookies and local storage really serve difference purposes. Cookies are primarily for reading server-side, local storage can only be read client-side. So the question is, in your app, who needs this data — the client or the server? If it's your client (your JavaScript), then by all means switch. You're wasting bandwidth by sending all the data in each HTTP header. If it's your server, local storage isn't so useful because you'd have to forward the data along somehow (with Ajax or hidden form fields or something). This might be okay if the server only needs a small subset of the total data for each request.
  - **Size** -> Apart from being an old way of saving data, Cookies give you a limit of 4096 bytes (4095, actually) - its per cookie. Local Storage is as big as 5MB per domain.
  - Cute -> you can test your local storage [here](http://arty.name/localstorage.html). 