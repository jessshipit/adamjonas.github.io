---
layout: post
title: "rails helpers"
date: 2012-07-18 16:58
comments: true
categories: helpers rails
---

'Helpers are methods in modules that you keep mostly hidden out of the way. The idea is to keep as much Ruby code out of the views, so helpers are mainly for use in that context. Helpers are the only methods you can access, other than instance methods for an instance you have access to.' [except from](http://strugglingwithruby.blogspot.com/2008/10/view-part-2-scope-helpers-and-partials.html)

[why this is important?](http://en.wikipedia.org/wiki/Dependency_inversion_principle)
and [my own write up of Dependency Inversion Principle](/blog/2012/07/18/solid-principles/)

Declare a controller method as a helper. For example, the following makes the current_user controller method available to the view. You
``` ruby
class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_id(session[:user])
  end

   def logged_in?
     current_user != nil
   end
end
```
In a view:
``` ruby
<% if logged_in? -%>Welcome, <%= current_user.name %><% end -%>
```
Parameters
method[, method] - A name or names of a method on the controller to be made available on the view.

A solid beginner's break-down (it's a little old though) is [here](http://strugglingwithruby.blogspot.com/2008/10/view-part-2-scope-helpers-and-partials.html).
