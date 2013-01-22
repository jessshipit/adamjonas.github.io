---
layout: post
title: "RubyMotion Pre-work"
date: 2013-01-20 19:29
comments: true
categories: rubymotion
---

  - Ruby Motion Tool Chain from the command line with `motion`
  - create a new project with `motion create <app name>`

  - `rake -T` gives you a list of tasks
  - `rake` builds the application and opens the simulator

  - Cocoa touch is a framework and calls back into our code using the delegate pattern.
    - there are special callback methods to hook into the lifecycle

```ruby Creating an alert
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    alert = UIAlertView.new
    alert.message = "Hello!"
    alert.show
    true
  end
end
```

###What is the frame?
  - a rectangle for the window.
    - it's an origin, an X and Y coordinate
    - and it's also a size

###Making a Yellow Screen
```ruby A Yellow Flashlight!
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.backgroundColor = UIColor.yellowColor
    @window.makeKeyAndVisible
    true
  end
end
```

###Using the Console
When the console builds it provides a console. If I hover with the mouse, nothing happens. But if I hold the cmd key, it puts the element in the console and you can assign it to self or a variable.

So `#<UIWindow:0x10922060>)> self`
and `#<UIWindow:0x10922060>)> self.backgroundColor = UIColor.greenColor` will change the color right in the console.

Can grab objects, put them in the console and manipulate them interactively.

###Views
  - each view that we have sits in a view and is managed by a view controller
  - 
Each 

###ViewController
  - UIViewController is where all the magic happens


###UI Kit
  - the x and y coordinate starts in the upper left corner and x goes -> and y goes down.


###Gesture Recognition
  - when a view is tapped it sends an action to a particaular target.

###What is a delegate
When the user launches our app, the system sets up a bunch of stuff for us. We need to give the operating system an object which can respond to different events during that process; we refer to that object as the "application delegate". It gets callbacks for when the app starts, ends, goes to the background, gets a push notification, etc. [source](http://rubymotion-tutorial.com/1-hello-motion/)

###Views
  - Everything displayed in an app is called a "view".- A view can have many "subviews"; when you move a view, you also move its subviews. 
    - Subviews visually stacked on top of each other within their parent.

###Resources:
  - [50 min screencast](http://pragmaticstudio.com/screencasts/rubymotion)
  - [Promotion](http://www.clearsightstudio.com/insights/ruby-motion-promotion-tutorial)
  - [HTML book](http://rubymotion-tutorial.com/)