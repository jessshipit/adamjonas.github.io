---
layout: post
title: "Rails 4 CSRF handling"
date: 2014-05-01 11:19
comments: true
categories: rails csrf
---

##Setup
Right now we are building "Ironboard" (title is WIP) -- an application that makes makes consuming prework a breeze for students and creating and organizing prework a breeze for teachers. This application is going to fit into a workflow that kicks off when a student pays their deposit. The short version is that another internal app is going to ping an endpoint on Ironboard, which internally will generate an email invitation and enroll that student in course so that the instructor can track their progress.

##CSRF
I've read the [rails security guide](http://guides.rubyonrails.org/security.html). I searched [stackoverflow](http://stackoverflow.com/questions/16258911/rails-4-authenticity-token) and quite frankly the documentation for handling CSRF in rails 4 is sucky. [Alex Coco](http://alexcoco.com/forgery-protection-strategy/) seems to have done the most documentation here. Buried in all of this is the [proper way to handle cross-domain requests](http://weblog.rubyonrails.org/2011/2/8/csrf-protection-bypass-in-ruby-on-rails/) in 2011:

>Users can override this behaviour by overriding `handle_unverified_request` in their own controllers. 

Most answers that are out there have to do with disabling the `protect_from_forgery` method in a specfic controller for a specific action. This hides csrf vulnerability, but I'm not sure that disabling token authenticity makes things any better. Why use `protect_from_forgery except: :ping_from_registrar` when we could use the `handle_unverified_request` 

We ended up using:

```ruby
class Api::FooController < ApplicationController
  skip_before_action :authenticate_user!

  private
  def handle_unverified_request
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      token.eql?(ENV['API_TOKEN'])
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: 'Bad credentials', status: 401
  end
```

I think this is pretty awesome.

[This was helpful](http://stackoverflow.com/questions/12761544/rspec-request-how-to-set-http-authorization-header-for-all-requests) as was [this](http://blog.envylabs.com/post/75521798481/token-based-authentication-in-rails).
