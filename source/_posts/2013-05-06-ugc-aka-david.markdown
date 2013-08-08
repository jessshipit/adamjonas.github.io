---
layout: post
title: "ugc aka David"
date: 2013-05-06 12:07
comments: true
categories: 
---

It is common to create apps that heavily depend on user generated content. David is an attempt to build the prototypical user generated content app. One that we will be able to reuse in the future. 

The structure on creating such an app was challenging for me to conceptualize. I would anticipate that we will use David most of the time for image submissions only, but juggling multiple MIME type submission is the real challenge and therefore would be the greatest benefit to solve. Given this, how should this application be structured? Should the individual types (images, videos, text, audio, etc) inherit from a centralized submission class? Should that centralized class be a module that is included in each of the individual classes? Where would one build out the features for a custom app? 

After discussing with Kyle for a while, he decided that it was probably safest to build an add-on to CarrierWave that would accomplish this for us. This would leave the uploaders available for customization, while keeping the classes more pristine. 

There are a whole mess of add-ons [listed](https://github.com/jnicklas/carrierwave/wiki).

Next, deciding on where this add-on would live. Should this be a gem or live in the lib folder?

###Mixed context processor uploading
  - [how to do conditional processing](https://github.com/jnicklas/carrierwave/wiki/How-to%3A-Do-conditional-processing)
  - [a gist](https://gist.github.com/ahamid/995663)

###Adding Versions
  - [Adding versions straight from the horses mouth](https://github.com/jnicklas/carrierwave#adding-versions)

###FB SDK
  - so I jumped right into trying to call SDK methods without understanding how the SDK was initialized.
    - [the documentation](https://developers.facebook.com/docs/reference/javascript/#loading) is pretty clear, but I had just been able to call on the SDK in previous projects, so I didn't understand what was different. Carrot-facebook had taken care of this under the hood.

###Javascript Event Listeners
  - excellent explanation of the difference between 

```javascript
document.getElementById("db-chooser").addEventListener("DbxChooserSuccess",
    someFunction() {
        code
    }, false);
```

and

```javascript
document.getElementById("db-chooser").addEventListener("DbxChooserSuccess", someFunction, false);
```

which is REALLY different from: 

```javascript
$("#db-chooser").addEventListener("DbxChooserSuccess",
  someFunction() {
      alert("this doesn't work")
  }, false);
```

I don't have a firm handle on event listeners, but this is a good lesson to get my feet wet.

###Asset Path
  - stupid problem. I loaded a library to the vendor folder, but it wasn't loading. I tried specifying the route even though I know that the asset pipeline picks up everything in the vendor folder.
    - ended up being the .min extension. Once I explicitly specified the extension (.min.js), it found it.

###Instagram
  - there is a [instagram ruby gem](https://github.com/Instagram/instagram-ruby-gem) that looks very similar the [Pengwynn](https://github.com/pengwynn/) style ruby wrappers
  - for David, I'll be using [instajam](http://mikefowler.me/instajam/) by Mike Fowler so that I can load the photo via javascript

###Factory Girl
  - [factory girl hooks](http://robots.thoughtbot.com/post/9713995255/factorygirl-2-1-0-brings-the-heat)
  - [factory girl associations](http://icelab.com.au/articles/factorygirl-and-has-many-associations/)

###Rating system
  - [active record reputation system](http://railscasts.com/episodes/364-active-record-reputation-system)

###Responds with
  - [solid responds with explanation](http://stackoverflow.com/questions/6118639/rails-respond-with-how-does-it-work)

###Pagination
  - [kaminari](https://github.com/amatsuda/kaminari) -> uses several partials to render the different options, need to override partials to customize the behavior. Because of this technique, Kaminari might be a wee bit slower than will_paginate. ActiveAdmin uses Kaminari.
  - [will_paginate](https://github.com/mislav/will_paginate) -> uses Ruby options to customize.

###Integration Tests
  - with rspec
    - install rspec
      - `rails g integration_test modelname`

###Copy to clipboard
  - it appears that the most dependable implementation is with flash. See [4 different ways](http://www.jquery4u.com/plugins/jquery-copy-clipboard-4-options/) and ZeroClipboard(https://github.com/jonrohan/ZeroClipboard/blob/master/docs/instructions.md) which I eventually settled on. There is a nice step-by-step tutorial by [David Walsh](http://davidwalsh.name/clipboard).
  - put the flash file in the public folder rather than the asset path since it will remain untouched rather than serve dynamic content.

###completed
  - one central controller with meta programmed methods to redirect to the proper path using service
  - models that inherit from a specific media type
  - override file column on submissions model -> just made it optional for text, can I make that only the case for text?
  - do for images and video what I did for text
  - create a whitelist of acceptable uploads per type / identify the type by the extension?

  - Facebook
    - create credentials table with type, uid, access token, and user_id from Omniauth
    - pull photos with javascript like in oakley
    - authenticate with button and pull up a gallery of FB photos
      - select which one you want and store the URL
  - instagram gallery of photos

  -testing
  - once photos selected, they need to be saved to DB under UrlSubmission
  - reassigning the token for FB auth

###Goals
  - understand how version works

  - testing js with jasmine

  - gallery (what's been submitted and saved to DB)
    - highest rated (rating system)
    - /most recent (reverse time)
    - /pagination
    - see friend's photos (hold off)
    
    - copy url from submission show page functionality
      - https://github.com/jonrohan/ZeroClipboard

  - rating system
    - limit frequency
    - time gate

  - winner selection lib (maybe in the end, randomly, highest rated?)

###Deficiencies
  - no photo resizing thus far
  - lacks integration/JS/Ajax. limited unit tests.
  - distinguish types by white labeling extensions per type, just one white labeling group right now for all types