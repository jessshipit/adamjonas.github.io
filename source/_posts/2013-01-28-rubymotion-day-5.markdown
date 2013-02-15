---
layout: post
title: "RubyMotion Day 5"
date: 2013-01-25 09:54
comments: true
categories: rubymotion
---

###CA Animation
  - Animation family tree
    - CA Animattion
      - CA Animation Group
      - CA Property Animation
      - CA Transition
        - CA basic animation is for linear animation
        - keyanimattion is for more specific or non-linear animation


  - Animated Properties
    - CGColorRef -> shadowColor, borderColor
    - NSNumber (float) -> opactity, shadowRadius
    - NSVAlue (CGRect) -> bounds, contentsRect
    - NSValue (CGPoint) -> anchorPoint (is the center point for rotation), position
    - NSValue (CATransform3D) -> transform

  - CATransform3d
    - CoreGraphics is just in 2 dimensions
    - Can add a perspective column in the z column -- (as opposed to just x and y planes (the 3rd column is for perspective) -- to create the illusion that it is tilted back

  - Easing: to control the acceleration or deceleration of the objects in the animation. This is used to simulate real life forces like friction or gravity.

##Web Services
  - Synchronous URL Fetch (not recommended) -> *if you block the main thread, your application will freeze*
    - NSURLConnection -(request)-> NSMutableURLRequest -(URL)-> NSURL
      - NSURLConnection, the class of CocoaTouch to send requests to web services
  - Asynchronous URL Fetch (the one we are going to use)

  - we can block the whole app execution until the web service responds OR send the request and forget about it, avoiding blocking the app execution. Once the service responds we process the result.
    - The later option is the right one.
  - We send and Asynchronous request to the service using a NSOperationQueue. This block of code will be executed in a background Queue defined by the NSOperationQueue.
      - This block receives three parameters:
        - response: An object with an instance of NSURLResponse.
        - data: The response returned by the service as a NSData object.
        - error: An NSError with the error, if any, returned by the service.

###Core Data
  - StoreTypes
    - SQlite, binary file, NOT xml formats (only available in OS10)
  - Predicates
  - NSManagedObject
    - class capable of storing data for an instance of any entity.
    - access properties (attributes, relationships) via key-value coding methods (valueForKey:, setValue:forKey)
  - Relationships
    - delete rule: "if an attempt is made to delete the source object..."
      - nullify (the inverse relationship)
      - deny (if any destination relationships)
      - cascade (delete any destination relationships, too) -> *very dangeous*
      - No action

```ruby
  # In Core Data we can have relationship between objects, so lets add one
  # to the Director Object
  @relationships ||= [

    # IMPORTANT: In Core Data is required to have a circular relationships between
    # the two objects. In these case we are adding a Relationship from Movie to Director
    # but also we will need one from Director to Movie, these relationship is called Inverse
    # Relationship

    # Relationship Name, Relationship Class, Inverse Relationship, Is Optional, Is Indexed,
    # Is Ordered, Min Count, Max Count, Delete Rule
    ['director', 'Director', 'movie', true, false, true, 0, 1, NSNullifyDeleteRule]
  ]
```

  - The relationships in Core Data are circular, what these means is that if we want to create a relationship from Movie to Director we also need another one from Director to Movie.


###Debugger
  - rake debug=1, backtrace (or bt), fr <number>
    - n to step to the next line in the file
    - quit to quit.

###3rd Party Libs
  - CorePlot -> to build graphs

###Wrappers
  - [formotion](https://github.com/clayallsopp/formotion -> to easily create complex forms
  - [walt](https://github.com/clayallsopp/formotion) -> wrapper of core animation
  - [teacup](https://github.com/clayallsopp/formotion) -> pretty much create a stylesheet for the views
  - [sugarcube](https://github.com/clayallsopp/formotion) -> redefining methods to be more semantic

