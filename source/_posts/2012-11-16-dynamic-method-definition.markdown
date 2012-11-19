---
layout: post
title: "Dynamic Method Definition"
date: 2012-11-16 21:26
comments: true
categories: metaprogramming 
---

As a beginner, when I run into a problem my first instinct is to power through and simply find a way to get it done-- the brute force method. This means that I am rarely going to write good code during the first attempt. Once it is working however, I of course have the opportunity to return later and make it better. As Kent Beck says,
>make it work, make it right, make it fast.

Refactoring is about making it right by changing the internal structure without changing the external behavior.

*[Refactoring: Ruby Edition](http://www.amazon.com/Refactoring-Ruby-Jay-Fields/dp/0321603508)* has lots of great examples and methods for refactoring code. Inspired by the book, I gave a [presentation on the subject](https://speakerdeck.com/ajonas04/refactoring-with-examples) last week. My example of **Dynamic Method Definition** was the clear winner based on the feedback from the audience so I'll outline it below...

One of the most prominent clues that code needs refactoring is duplication...
```ruby Can you spot any repetition?
  def name
    self.info.name
  end
 
  def open_issues
    self.info.open_issues
  end
 
  def watchers
    self.info.watchers
  end
end
```

###Enter Metaprogramming...
Metaprogramming is:
>A program which modifies or generates other programs.

Instead of writing out each individual method, why don't we use the power of *Dynamic Method Definition* to write these three methods for us?
```ruby Dynamic method definition in action
def self.repo_params(*args)
  args.each do |arg|
    define_method arg.to_sym do
      self.info.send(arg)
    end
  end
end
  repo_params :name, :open_issues, :watchers
```
There is a lot going on here so let's take a closer look.
```ruby Line by line 
#this is a class method that accepts an 
#arbitrary number of arguments as a splat
def self.repo_params(*args)
  #the splat array is then iterated over and
  #each of the arguments is yielded as the variable 'arg'
  args.each do |arg|
    #the define method accepts a symbol and
    #names the argument after that symbol
    define_method arg.to_sym do
      #that same argument is then called as a method on self.info
      #which mimics the patterns of every method in the original
      #using dynamic dispatching via the send method
      self.info.send(arg)
    end
  end
end

#repo_parms is then called with as many parameters
#as you would like to add
  repo_params :name, :open_issues, :watchers
```
Pretty slick huh?

This use of dynamic dispatching isn't about semantics and code clarity (although it improves the code in both areas), use of this method is about maintainability. As we expand our list of attributes, we simply need to add the new parameter to repo_params. Easy peasy.

*[Refactoring: Ruby Edition](http://www.amazon.com/Refactoring-Ruby-Jay-Fields/dp/0321603508)* should be required reading for anyone to graduate from the 'beginner' stage. Dynamic method definition is one of about 203,234,984 things that the book will teach you. Go read it.