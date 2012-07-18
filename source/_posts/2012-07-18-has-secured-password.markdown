---
layout: post
title: "has_secured_password"
date: 2012-07-18 15:23
comments: true
categories: rails authentication
---

[Rails Cast on Authentication Rails 3.1](http://railscasts.com/episodes/270-authentication-in-rails-3-1)
also want to check out [Rails cast on Authentication from Scratch](http://railscasts.com/episodes/250-authentication-from-scratch)

The user model rails allows you to call
``` ruby has_secure_password
class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create
end
```
You will likely want to add validation for the email address as well, but that's outside the scope of this...

The has_secure_password setting automatically adds validation for mismatched password between the password and password confirmation fields.

###Helper Methods: specifically :current_user###
See the [post on this](/blog/2012-07-18-rails-helpers/).

###SSL###
can also add options for ssl with the simple line in the ApplicationController:
``` ruby 
protect_from_forgery
force_ssl
```
This will only be reflected in production and test environments NOT development...