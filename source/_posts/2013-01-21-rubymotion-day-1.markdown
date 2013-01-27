---
layout: post
title: "RubyMotion Day 1"
date: 2013-01-21 09:45
comments: true
categories: rubymotion
---

###Course Goals
  - Objective-c Conventions
  - Using C Libraries
  - Platform Idioms
  - Key concepts: pointers, memory management, objects, messages
  - Fundamental iOS libraries
  - Cocoa patterns
  - Testing

###History of why Objective-C
  - NeXt
    - used objective-c to write the main platform
      - there was a debate on which was better between objective-c and c++, C++ eventually won
    - If you wanted to write an application on NeXt you needed to use NeXt builder
    - OSX was built next and there are a lot of things in OSX that were inherited from NeXt
  - iOS is basically a version of OS10

###iOS Overview 
  - The window server and Cocoa send events and messages to each other. It is a two way communication.
  - each application has its own loop of communication. Responsible for send and receiving events from the window server.


  - For each object in the nib file
    - Class is sent `alloc` to create interface
    - New instance is sent `init`
    - Instance variables are set

###Application States
  - Two states: foreground and background
    - two states for foreground: inactive and active
    - in the background: you can do tasks in the background, after it is done it will go to suspended

###Cocoa
  - UIkit is the main library that comes with cocoa and certainly the most important.

###App delegate
- There are at least two classes. The application class and the application delegate.

###Create a new project
`motion create <app name>`

  - fonts, images, assets all go in the resources folder

###Rake
  - `rake -T` gives me a list of all the rake tasks
    - can build for a device or build for the simulator
  - can create a static library with `rake static`
  - `rake config` gives you output on the frameworks, delegate_class, etc.
    - CoreGraphics lib is what we use for animation

###Deploying the application
  - need an apple certificate and developer certificate


###To see the UI structure 
`UIApplication.sharedApplication.keyWindow.recursiveDescription` -> this will give you the tree structure of what you have created.

###Changing attributes in the console
`self.font = UIFont.fontWithName("Noteworthy-Bold",size:18)` will change the font of the label that you have highlighted.

##Object C
  - objective-c is an objected oriented flavor of c
  - heavily influenced from Smalltalk language
  - all keywords begin with @

  - RubyMotion adds named parameters similar to Ruby 2.0
  - Both Ruby and Objective C has the notion of open classes, single inheritance and single message dispatch

`now dateByAddingTimeInterval:1000`, structure is the `receiver theSelector:argument`

  - messages always enclose the receiver and the selector inside a pair of square brackets. These brackets can be nested.
  - *id* is a pointer to any object type.

  - you can invoke objective-c OR ruby methods against built in classes
  - `[1,2,3].send(:objectAtIndex, 1)` -> you need the colon or it won't find the selector!
  - helpful to use short methods and callbacks because the method will not be released until it is terminated.

###Objective C Classes
  - NSString (similar to when you freeze something in Ruby) v. NSMutableString
  - NSSArray v. NSMutableArray
  - NSSet v. NSMutableSet
  - NSDictionary v. NSMutableDictionary

  - `my_string = "hello"` -> this is mutable
  - `my_stgring = NSString.alloc.init` -> this is immutable

###NSArray
  - NSArray is immutable. Once you create one it can't be modified. NSMutableArray is a mutable subclass of NSArray
    - need to terminate a `NSArray.arrayWithObjects(foo, bar, baz, nil)` with a `nil` or it will crash.

###NSSet
  - Sets are collections with no order and objects can be present only once (can only be added once).It is useful when dealing with membership issues.
  - `.unionSet`, `.intersectSet`

###NSDictionary
  - Dictionaries are unordered and associate a key.

###Constants
  - in objective c -> constants usually start with k -> `kItemCode`
  - in Ruby make sure that this is uppercase -> `KItemCode`

###Defining a class
  - Obj c uses the keyword `@interface` to define the class
  - Obj c only supports *single inheritance*. You can only inherit from one superclass at a time.

###Protocols
  - similar to the concept of interfaces in java or C-sharp
  - a protocol is a contract. It is a promise to the compiler that a given class will implement a given interface.

###Categories
  - the way to add methods to an existing class

###Structures
  - C structures are mapped to classes in RubyMotion. `CGPoint` is very common.
  - It is possible to pass the field views directly to the constructor `pt= CGPoint.new(100,200)

###Pointers
  - Pointers are basic data types of the C language
  - RubyMotion supports the creation o structure pointers, by passing their runtime type accordingly to `Pointer.new`

###Blocks
  - The caret (^) character is used to define C blocks
  - The Prob object must have the same number of args as the C function pointer or block, otherwise an exception will be raised at runtime

###Keyboard doesn't toggle by default
  - Add this code

```ruby
  def textFieldShouldReturn(textfield)
    textfield.resignFirstResponder
    return false
  end
```

###Setting a title of a button
`@instance_var.setTitle("TITLE",forState:UIControlStateNormal)`

###List of wrappers
  - <http://rubymotion-wrappers.com/>