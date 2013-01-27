---
layout: post
title: "RubyMotion Day 4"
date: 2013-01-24 09:58
comments: true
categories: rubymotion
---


###Auto-rotation in View Controller

###Notifications

###File Structure
  - the RubyMotion compiler recursively checks all the file directories and adds the files. If I brake out a method it will find it and I don't need to wrap it in a class or anything in the other file.

###Variables
  - always want to use the sdk_version
  - the deployment_target is the lowest version of the iOS device that you want to run on
    - in the app delegate file I can set the deployment target to `app.deployment_target = 5.1`
    - `rake target=5.1` launches the device in the specified iOS
      - check the device with `UIDevice.currentDevice.systemVersion`

###States
  - [Apple Explains States and Multi-tasking](http://developer.apple.com/library/ios/#documentation/iphone/conceptual/iphoneosprogrammingguide/ManagingYourApplicationsFlow/ManagingYourApplicationsFlow.html)

###CA Layers
>The CALayer class manages image-based content and allows you to perform animations on that content [See Apple Docs](The CALayer class manages image-based content and allows you to perform animations on that content)

  - can create a tree structure for CA Layers just like you can create a tree structure for controllers and views

  - Using the REPL to play with the layers p. 138
  - We are using gradients in Chapter 20 p. 141-42.

  - `addSublayer(grass_layer)` is for adding on top of an inserted sublayer

###Bug with Objective-c array
  - ran into another instance of when the compiler breaks on an objective-c array. This happened on the first day as well. Need to pay attention to this.
    - the steps to debug are: `rake debug=1`, then `backtrace`, lower-case `quit` to quit the debugger

###Deploy to your device
  - `rake device` will deploy it to the device
  - `rake device debug=1` will deploy with a debugger