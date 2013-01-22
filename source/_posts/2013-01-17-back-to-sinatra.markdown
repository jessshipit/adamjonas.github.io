---
layout: post
title: "Back to Sinatra"
date: 2013-01-17 19:19
comments: true
categories: sinatra
---

- Couldn't launch on heroku because I didn't have a gemfile.
- Then I could removed all the gem requirements from the top of the `main.rb` file. Not how it's done.

- Since I need two different keys to for FB authentication I configured them in the main `app.rb` file. I tried setting these in a `.env` file and start up the app locally with foreman, but I couldn't get it to work.

```ruby
class MyApp < Sinatra::Base
  configure :development do
    ENV["FACEBOOK_APP_ID"]='numbers'
    ENV["FACEBOOK_SECRET"]='key'
  end

  configure :production do
    ENV["FACEBOOK_APP_ID"]='numbers'
    ENV["FACEBOOK_SECRET"]='key'
  end
end
```
Found this solution on [stackoverflow](http://stackoverflow.com/questions/4486634/is-there-a-rack-or-sinatra-based-environment-configuration-utility)


- [HTML Tick symbol](http://stackoverflow.com/questions/658044/tick-symbol-in-html-xhtml)