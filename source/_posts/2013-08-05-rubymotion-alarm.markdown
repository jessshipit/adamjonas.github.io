---
layout: post
title: "RubyMotion Alarm"
date: 2013-08-05 13:34
comments: true
categories: rubymotion
---


##positioning
  - UI elements in iOS have a frame. Think of it as the frame for a photograph on your wall. When you create elements, you have to specify the frame, in the following format:
    - [[x, y], [width, height]]

##CocoaPods
  - like RubyGems for ruby
  - nice summary [here](http://mobile.tutsplus.com/tutorials/iphone/streamlining-cocoa-development-with-cocoapods/)

##add_periodic_timer
  - run this code every second -> `EM.add_periodic_timer 1.0 do`
  - `add_periodic_timer` is actaully an [event machine](http://eventmachine.rubyforge.org/EventMachine.html) method
  - this is made possible by the bubblewrap which used BW::Reactor
    - BW::Reactor is a simplified, mostly complete implementation of the Event Machine API. In fact BW::Reactor is aliased to EM in the runtime environment.

###Leading zeros
  - [`rjust(integer, padstr=' ') → new_str`](http://stackoverflow.com/questions/5810468/leading-zeros-in-rails)

###Promotion slide menu
  - we started by using [this](https://github.com/macfanatic/promotion_slide_menu) but dropped it and dropped promotion altogether.

###Colors with bubble wrap
  - instead of `UIColor.whiteColor` you can just do `'white'.to_color`

###Delegates for input field

```ruby Delegate pattern
  def on_load
    @input_field = UITextField.new
    add(@input_field, setting_input_style)
    @input_field.delegate = self
  end

  # - (BOOL)textFieldShouldReturn:(UITextField *)textField
  def textFieldShouldReturn(textField)
    urlString = textField.text
    if urlString.length > 1
      loadRequest(urlString)
    end
    textField.resignFirstResponder
    true
  end
```

###initWithFrame
  - Can't pass in parameters to initWithFrame and having trouble setting variables. So invoke a new method called 'initWithFrameAndImage' passing the neccessary parameters and then call initWithFrame within that method.

```ruby
def initWithFrameAndImage(frame, picture)
  initWithFrame(frame)
  @time_pic = UIImageView.alloc.initWithImage(UIImage.imageNamed(picture))
  add(@time_pic) #, tile_style)

  set_attributes self, {
    background_color: hex_color("F6F6F6"),
    layer: {
      shadow_radius: 4.0,
      shadow_opacity: 0.4,
      shadow_color: UIColor.blackColor.CGColor
    }
  }
  self
end
```

###Scrolling
  - adding elements to a scroll is rather easy with promotion. Keep in mind that you can't be adding multiple elements as a splat or anything. If you are iterating over a bunch of tiles, for example, they need to be added to the UIScrollView individually.

```ruby
def on_load
  @scroll = add UIScrollView.alloc.initWithFrame(self.view.bounds)
  add_to @scroll, element
  @scroll.frame = self.view.bounds
  @scroll.contentSize = CGSizeMake(@scroll.frame.size.width, content_height(@scroll) + 20)
end
```

###Stuff I didn't understand
  - `makeKeyAndVisible` specifies which window is current. Despite the fact that most apps only have one window, there is no way to assume that your primary window is to be the key window. Therefore you must explicitly call makeKeyAndVisible. [see](http://stackoverflow.com/questions/14714688/examples-where-makekeyandvisible-is-not-required-for-uiwindow)
  - Use a UIScrollView with pagingEnabled=YES to switch between pages, but you need pagingEnabled=NO to scroll vertically. [see](http://stackoverflow.com/questions/728014/uiscrollview-paging-horizontally-scrolling-vertically)
  - The purpose of dequeueReusableCellWithIdentifier is to use less memory. If the screen can fit 4 or 5 table cells, then with reuse you only need to have 4 or 5 table cells allocated in memory even if the table has 1000 entries.[see](http://stackoverflow.com/questions/2928873/iphone-dequeuereusablecellwithidentifier-usage)
  - can't add a target to a UIView. Need to add a UIButton to the UIView and THEN add a target to the UIButton.
  - bringSubviewToFront
  - clipsToBounds -> like overflow hidden. great for circular mask type images.
  - toll-free bridge => ruby class inheriting from objective-c ancestors so that both ruby and objective-c methods can be called on an object.

###CALayers
  - CALayers are simply classes representing a rectangle on the screen with visual content. A [tutorial](http://www.raywenderlich.com/2502/calayers-tutorial-for-ios-introduction-to-calayers-tutorial)

###RMQ => JQuery for RubyMotion
  - jQuery-like [library for RubyMotion](https://github.com/infinitered/rmq)
  - [pdf reference of methods](https://ir_public.s3.amazonaws.com/projects/rmq/rmq_guide.pdf)

###Garbage Collection
  - RubyMotion’s memory management system is designed to simplify the development process. Unlike traditional Objective-C programming, object references are automatically created and destroyed by the system. It is very similar to Objective-C’s ARC, in design, but it is differently implemented. [via](https://groups.google.com/forum/#!topic/rubymotion/hXvb9PVX0_Y) 
    - [An explanation of ARC](http://stackoverflow.com/questions/6385212/how-does-the-new-automatic-reference-counting-mechanism-work)

###Observer Pattern vs. NSNotificationCenter vs. Key/Value Observing (KVO)
  - micheal erasmus has a gem [observable](https://github.com/michael-erasmus/rubymotion-observer), which is a compatible implementation of the ruby stdlib Observable library.
  - bubblewrap provides helper methods to give NSNotificationCenter a Ruby-like interface.
  - bubblewrap also allows you to observe for object's changes and trigger blocks.

###Deploy to device
  - This was a [tremendous help](http://joshsymonds.com/blog/2012/05/10/from-the-rubymotion-simulator-to-your-friends-iphone/). I did all the steps up to step 6.
  - we also created dot files which stored the dev cert and the path of the mobile provision

###Obj-c to rubymotion
```objective-c
UIWindow *window = [[UIWindow alloc] initWithFrame:frame]
```
`UIWindow` is the type of the variable pointer. `*window` is the pointer. `UIWindow alloc` allocates memory and returns a new object. `initWithFrame` is calling on the new object that is created via the `UIWindow alloc`.

```ruby
@window = UIWindow.alloc.initWithFrame(frame)
```
We are setting @window as an instance variable to prevent premature garbare collection.

**Another Example**

```objective-c Method in Obj-C
  UITapGestureRecognizer *recognizer =
    [[UITapGestureRecognizer alloc] initWithTarget:self 
                                    action:@selector(tapped_purchase_button:)];
```

  - This is a two parameter method. This first parameter is the target, which is self. Second param, is the action or method that we want to send to that target.
  - to call methods dynamically in objective-c you use the @selector(method_name). This is how it is invoked in objective-c

```ruby In Ruby
recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, action:'tapped_purchase_button')
```

###Loading a json file
  - need to create a NSData Object and read in the data.
  - need to use a pointer for error handling.
  - NSDataSerialization.JSONObjectWithData(raw_data, options:NSDataReadingUncached, error:errorPointer)
  - [38:04 in prag screencast](http://pragmaticstudio.com/screencasts/rubymotion)

```ruby
def loadAnswers
  answerFile = NSBundle.mainBundle.pathForResource('answers', ofType:'json')
end

errorPointer = Pointer.new(:object)
data = NSData.alloc.initWithContentOfFile(answerFile, options:NSDataReadUncached, error:errorPointer)

NSDataSerialization.JSONObjectWithData(data, options:NSDataReadingUncached, error:errorPointer)
```

###Push Notifications
  - Your service (a.k.a. the publisher of the app) sends a message with a token that is wants to send a push notifcation to Apple Push Notification Service (APNS).
  - APNS then decides whether to relay your push notification onto the app.
  - there a good tutorial at [parse](https://parse.com/tutorials/ios-push-notifications)

###Testing
  - RubyMotion uses MacBacon and the UIAnimation framework to do UI testing. 
  - [quick tutorial](http://blog.rubymotion.com/post/26489000626/functional-view-and-controller-testing-with-rubymotion)
  - subviews are not found the same way as top level views