---
layout: post
title: "RubyMotion Day 2"
date: 2013-01-22 09:41
comments: true
categories: rubymotion
---

- Cocoa touch is the high-level Objective C programming API for iOS.

###What is a framework
  - a collection of classes that are intended to be used together. That is, the classes are compiled together into a reusable library of code (static or dynamic).
  - The framework can define versions

###Other Frameworks
  - CoreData
  - CoreLocation -> framework that allows you to access the geo location and heading of the device
  - MapKit -> provides an interface to embed maps into your applications as well as other advanced functionality such as adding custom annotations, reverse-geocoding lookups, etc.
  - CoreGraphics
  - GameKit

###MVC/MVP
  - The presenter is more responsible in RubyMotion than in traditional MVC
    - model still a good place to abstract logic from the controller

##Callbacks
>Callbacks are methods or functions that are invoked when something happens
    - Target-action -> send one message to another object
    - Delegates -> send more than one message to another object
    - Notifications -> many to many. Send a message to 10-15 objects. The most flexible, but also the most dangerous.

  - Target-Action
    - NSButton sends a target to TimeZoneController
      - (make sure to include the colon (:) )

  - Delegates
    - NSTableView -> delegate -> MyClass

  - Notifications
    - NSNotifcationCenter is the class we use when we send or receive notifications
      - posting -> send a notification

###UIApplication and AppDelegate
  - UIApplicaiton class provides a centralized point of control and coordination for apps running on iOS. Every app must have exactly one instance of UIApplication
  - app delegate is an object created at app launch time, usually by the UIApplicatioMAin function. Its primary job is to handle state transitions within the app. e.g. this object is responsible for launch-time initialization.

###App Delegate
  - the app delegate class are optional
    - e.g. application:didFinishLaunchingWIthOptions: & applicationDidBecomeActive:

###nib files
  - A nib file is a data archive that essentially contains a set of freeze-dried objects that you want to recreate at runtime. Nib files are used most commonly to store preconfigured windows, views, and other visually oriented objects but they can also store non-visual objects such as controllers.
    - nib files originate from NeXt

###Initializers
  - Objective-C uses init* methods to initialize new instances
  - A class can have zero or more initializers
  - One initializer is the "Designated" -> this does all the heavy work and all other will call this one.
  - All initializers in the same class must call the designated initializer
  - The designed initializer must call the superclass's designed initializer

###Overwriting Initializers
  - If you override the initializer you need to return self
    - This is very important

###Alloc and init
  - alloc is a static method and init is an instance method

```ruby connects the UIButton to our controller
      sign_in_button.addTarget(self, 
                              action:'sign_in:',
                              forControlEvents:UIControlEventTouchUpInside)
```

##Core Location
  - CLLocationManager
  - CLLocation

###iOS Location
  - an iOS device can use up to 3 ways to determine its location (from best to worst accuracy):
    - GPS. For devices with that functionality such as iPhones or iPads with GSM/LTE.
      - for navigation or running apps, but high battery consumption
    - Cell towers triangulation. For devices with GSM/LTE.
    - WiFi hotspots.

  - KCLLocationAccuracyBest -> Drains the battery
  - KCLLocationAccuracyThreeKilometeres -> doesn't check all that often

###MKMapView
  - MKMapTypeStandard. Displays a street map that shows the position of all roads and some road names.
  - MKMapTypeSatellite. Displays satellite imagery of the area.
  - MKMapTypeHybrid. Displays a satellite image of the area with road and road name information layered on top.

###MapKit
  - MapKit uses a special structure called MKCoordinateRegion
    - has a CLLocationCoordinate2D  a structure which latitude and longitude values 
    - and a MKCoordinateSpan, that represents the amount of map to display in the vertical and horizontal space. You can see this Span as the zoom that the map will have.
  - To add a pin Annotations in MapKit you need to add an Annotation in Objective-C by creating a class that explicitly implements the MKAnnotation protocol.
    - In RubyMotion you only need to create a class with the same methods defined in the protocol. These methods are:
      - *coordinate*. Returns a CLLocationCoordinate
      - *title.* NSString with the main title of the Annotation.
      - *subtitle.* Optional, returns an NSString with the subtitle of the annotation.

  - MKAnnotion
    - is a protocol

##UIVIEWS
  - responsible for how to draw themselves
    - can use coreGraphics to draw very complicated things
  - knowing its subviews
  - accepting interaction

  - if you don't specify a view, the system will create one for you.

###Frames and bounds
  - all the dimensions are in points, not pixals (not affected by the definition of the device)
  - some APIs need bounds, while others need frames

###Lifecycle of a UIView
  - *life-cycle of UIView:* wait for an event -> touch event goes to a view -> event triggers -> custom method, may flag a view for refactoring -> redraw a view ->  render the view or views ->

  - dirty views -> views that need to be redrawn

###UIScrollView
  - provides support for displaying content that is larger than the size of the application's window. It enables users to use swipe gestures, and to zoom in and back from portions of the content by making pinching gestures.

##Testing
  - Bacon
  - Spec files
  - spec helpers
  - context
  - device events
  - Finding views
  - UIAutomation

  - [See the RubyMotion Testing Docs](http://www.rubymotion.com/developer-center/articles/testing/)

  - `rake spec:device` will push the code to the device as well as insert a debugger

  - MacBacon, a special flavor of the Ruby tool Bacon prepared to test iOS apps.

###Playing with the interface builder