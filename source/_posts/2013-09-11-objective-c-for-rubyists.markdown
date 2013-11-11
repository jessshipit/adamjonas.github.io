---
layout: post
title: "objective-c for rubyists"
date: 2013-09-11 16:35
comments: true
categories: objective-c ios
---

So RubyMotion is great. I can create an app in a few minutes by leveraging resources like [Bubblewrap](http://bubblewrap.io/) and styling becomes pretty straight-forward with [Teacup](https://github.com/rubymotion/teacup) and syntax looks much more Ruby-ish with [SugarCube](https://github.com/rubymotion/sugarcube).

Here's the thing. As a spoiled Rubyist, Objective-C as a language and CocoaTouch/iOS as is a framework is a verbose. That means that the code comes out really sounding like English. Not the poetry that Ruby is, but more like prose.  The fact that I am not learning the language isolated from the framework has led to problems for me in the past when I initially learned Rails before I learned Ruby. It isn't really a great way to learn, but I have always been driven by the application of a language more than the language itself, which is the case here.

###That whole thing is the method?

So RubyMotion isn't a superiority thing. I'd certainly prefer to be 100% fluent in objective-c from day one. Apple's documentation appears to be pretty steller. The problem for me however, is that everything just looks so hard in obj-c. Method declarations are pretty intimidating. So here I go to look up how to set the title of a UIButton and I find `- (void)setTitle:(NSString *)title forState:(UIControlState)state`. Now come on. That's a little much to set a title of a button right? A guideline I have always tried to follow with my own code is to only create complicated methods for complicated tasks. 

  - This declaration is preceded by a minus (-) sign, which indicates that this is an instance method, as opposed to a class method. It requires an object to call it, and instance variables of the object are available to it inside its definition. 
  - The (void) indicates the return type. This method doesn't return anything, so its result can't be assigned to anything.
  - This method name is `setTitle:forState:`
  - The number of colons (:) indicate how many arguments it takes. T
  - The first argument is the string to set the title to. 
  - The second argument is the button state (such as normal or pressed) in which to set the title. 

Here's an example of this method in use: `[myButton setTitle:@"Clicked!" forState:UIControlStateHighlighted];`. So after you break it down things seems little more reasonable, but it feels like it shouldn't be this hard.

### 


The specification of a class in Objective-C requires two distinct pieces: the interface and the implementation. The interface portion contains the class declaration and defines the instance variables and methods associated with the class. The interface is usually in a .h file. The implementation portion contains the actual code for the methods of the class. The implementation is usually in a .m file.

A class in Objective-C can declare two types of methods: instance methods and class methods. An instance method is a method whose execution is scoped to a particular instance of the class. In other words, before you call an instance method, you must first create an instance of the class. Class methods, by comparison, do not require you to create an instance

There's strong and weak typing for variables. 

Objective-c is from around 1983, invented by Brad Cox. Ruby is from 1995, which makes it a contemporary of Java.

Ruby is more script oriented, obj-c looks a lot more like lisp. The semi-colon takes some getting used to.

Underscore versus camelCase. Short method names in Ruby, while the cocoa convention is much more verbose. 

Name spacing in Ruby which Objective-C doesn't have.

On the surface, these look like very different languages.

Ruby is a decedent of Smalltalk, Perl, Eiffel, and Lisp. While Objective-C comes purely from Smalltalk and C.

Smalltalk was really the first object oriented programming language. Alan Kay and the X PARC geniuses invented the OOP concept in the early 70s. 

Conway's Law: software architecture reflects the communication structures of the community that is building it.

Objective-c and cocoa are dictated by Apple. It's Apple's app store and they dictate what is appropriate and what isn't. It is a benevolent (sometimes not so benevolent) dictatorship.

Ruby is on the other hand is a product of Rails. DHH singlehandedly put Ruby on the map in 2004. Rails is what the web needed in 2005. Github, heroku and twitter were all started as Rails apps.
  - most Rails devs were noobs
  - iconoclasts
  - dillitants
  - hipsters
  - scavengers -> turning to other languages
  - establishmentarians

  - TDD
  - Tooling -> throw out older tools
  - progress versus subsistence
  - overthinking


We have entered the era of CocoaPods, which is now 2 years old. It is written in Ruby. 1300 projects on CocoaPods. This is the rise of Ruby gem. A dependency manager. This is a place to share creations.

- [objective c for Rubyists](https://peepcode.com/products/objective-c-for-rubyists) from peepcode

- [NUI](https://github.com/tombenner/nui) -> sass for objective-c
- [KIF](https://github.com/kif-framework/KIF) -> usable testing framework
- [reactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa) -> functional programmning for ios
- [Testing with Frank](http://www.testingwithfrank.com/) -> cucumber
- [Helios](https://github.com/helios-framework) -> 

http://www.slideshare.net/abdels/my-adventuresinobjc

- unlike ruby, obj-c is a strict superset of c

```objective-c
[world say:@"hello"];
```
```ruby
world.say("hello")
```


```objective-c obj-c message passing
[world say:@"hello"];

[world performSelector:@selector(say:) withObject:@"hello"];

objc_sendMSG(id object, SEL selector)
```

```ruby ruby message passing
world.send(:say, "hello")
```

```objective-c non-strict typing
id world = [[World alloc] init]
[world peace];

/*
'id' is a pointer to any object
*/

```objective-c non-strict typing
World *world = [[World alloc] init]
[world peace];

/*
this ensures the method compiler checks.
*/
```

attr_accessor equivalent
@synthesize creates dynamic setters and getters and performs the neccessary memory allocaiton
- interfaces with protocols

objective-c has blocks

[cupertino](https://github.com/nomad/cupertino)


###Strong versus weak pointers
The difference is that an object will be deallocated as soon as there are no strong pointers to it. Even if weak pointers point to it, once the last strong pointer is gone, the object will be deallocated, and all remaining weak pointers will be zeroed out.

Perhaps an example is in order.

Imagine our object is a dog, and that the dog wants to run away (be deallocated).

Strong pointers are like a leash on the dog. As long as you have the leash attached to the dog, the dog will not run away. If five people attach their leash to one dog, (five strong pointers to one object), then the dog will not run away until all five leashes are detached.

Weak pointers, on the other hand, are like little kids pointing at the dog and saying "Look! A dog!" As long as the dog is still on the leash, the little kids can still see the dog, and they'll still point to it. As soon as all the leashes are detached, though, the dog runs away no matter how many little kids are pointing to it.

As soon as the last strong pointer (leash) no longer points to an object, the object will be deallocated, and all weak pointers will be zeroed out.

[from](http://stackoverflow.com/questions/9262535/explanation-of-strong-and-weak-storage-in-ios5)