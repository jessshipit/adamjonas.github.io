---
layout: post
title: "The tap method"
date: 2012-07-02 10:52
comments: true
categories: ruby notes TODO
---

I haven't found great explanations for this yet but there is a video below... prety much the tap method allows you to initialize methods right off the bat.

The tap method is available to all Ruby objects and serves as a way to have a block "act on" the method's caller and return the object called. Per the Ruby docs, "the primary purpose of this method is to 'tap into' a method chain, in order to perform operations on intermediate results within the chain". For some examples on using tap see MenTaLguY's post on Eavesdropping on Expressions. As he says in his post, "you can insert your code just about anywhere without disturbing the flow of data."

I'm having some trouble following all this... Matt Stopa has a video below that is more for a beginner.

[The video is here](http://www.youtube.com/watch?v=QAJMxBkYaUQ)