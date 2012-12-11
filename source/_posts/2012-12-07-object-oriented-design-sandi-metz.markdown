---
layout: post
title: "Object Oriented Design Sandi Metz"
date: 2012-12-07 12:31
comments: true
categories: object-oriented
---

###Solid Object Oriented Design###
[Video of Sandi Metz](http://vimeo.com/12350535)

###Less the path to better design
[Video](http://vimeo.com/26330100)

- Code needs to work today just once, but needs to be easy to change forever
  - purpose of design is reduce the cost of change

- Patterns are prescriptions
  - patterns work at the correct dosage

- principles
  - SOLID
  - Demeter

- Need diagnostics
  - need simple ways to judge the goodness of code (the inverse of Bob Martin's list of ailments)

- 4 Diagnostics : True
  1. Code should be *transparent*
  2. *Reasonable*: cost of making any change should be to proportional to its value
  3. Code should be *useable* -> if you wrote the code, you should be able to reuse it
  4. *Exemplary* -> more code like this would be good for your app
- These principles tell you when to quit

1. Don't be a know-it-all
  - Code is more stable when the objects communicate less
    - For example, all the work that goes into building and curating bounties belongs in the bounty class and not in the issue class, even though bounties belong to issues
>managing dependencies is at the center of design. Depend on things that are more stable than you are.
    - early on in an app, you actually don't know which is more stable
      - embrace uncertainty. If two objects must collaborate and you don't know who is more uncertain. Then you need to make them know as a little of each other as possible. *A directive to decouple.*
    - Don't have to guess what changes will come. Loosen the coupling so that when a change came (and we didn't know what the change was) it would be ok.

2. It's Ducks all the way down
  - identify the underlying abstractions, from trip's point of view it just wants to be prepared
  - preparer is an agreement about the public interface of an idea -> it's a *duck type*
```ruby
def preparer(preparers)
  preparers.each {|preparer|
    preparer.prepare_trip(self)}
end
#then each class has it's own prepare_trip(trip) method which sends back a prepared trip.
```
- Abstractions are more stable than concretions. It is the duck type. 
  - You can trade the unpredictability for the constancy for what you want.
  - We share no code, there are no modules

###Trip expects preparers and prepares trust that they can pass the object to that called them
  - Trustworthy objects 
    - Understand more about themselves and what they want and know less about what others do
    - Depend less on concretions and more on abstractions

3. The space between objects
  - When objects have space around them they have room to move
  - Design allows you to put off design decision until you know more about the application

