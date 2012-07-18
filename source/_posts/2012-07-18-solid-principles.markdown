---
layout: post
title: "SOLID principles"
date: 2012-07-18 16:05
comments: true
categories: concepts oop
---

###[Single responsibility, Open-closed, Liskov substitution, Interface segregation and Dependency inversion](http://en.wikipedia.org/wiki/SOLID_%28object-oriented_design%29)###

Dependency inversion principle
:  one should “Depend upon Abstractions. Do not depend upon concretions.

This means that in the controller, it is better to define
``` ruby
def current_user
  @current_user
end
```
than using the instance variable because right now the instance var is concrete but you might want to add logic and redefine it:
``` ruby E.G.
def current_user
    @current_user ||= User.find_by_id(sessions[:id]) if session[:user_id] 
end
```