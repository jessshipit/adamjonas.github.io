---
layout: post
title: "Namespacing"
date: 2012-10-29 15:16
comments: true
categories: namespacing
---
Say my friend has a sister named Sue, and so do I. How can I tell them apart in a conversation? By using their last name. The last name is the namespace.

Modules define a namespace, a sandbox in which your methods and constants can play without having to worry about being stepped on by other methods and constants. 
```ruby
class Dog
  Species = ["Poodle"]
 end
```
Dog::Species => Species is a Constant within the Dog class. Species could be a class it could be a module, but it is a child of Dog.


