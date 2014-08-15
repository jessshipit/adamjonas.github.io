---
layout: post
title: "Presenter Objects"
date: 2014-06-17 18:49
comments: true
categories: presenter_objects
---

###From our PR thread
- A presenter object is a simply a PORO (plain ol' ruby object), constructed by the controller out of the data of one or more models, whose attributes serve the view
layer. So in our case we give a view a `LessonPresenter` that has a `css_class` attribute and remove all decision making from the view layer (which is the ideal goal).

- It's not a "service" object, it's a presenter so it would go in the `presenters` folder. This is also sometimes called a "view model" or a "view object". The word "presenter" is overloaded a lot.

- This an interesting read on a few [`model refactoring patterns`](http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/):

- So instead of a collection of Lessons at the view level, you'd be dealing with a collection of LessonPresenters or similar. Alternatively, you can just put that method on the lesson object itself, which is simpler and more straightforward but not strictly Single Responsibility Principle/Seperation of Concerns/Model View Controller compliant. tradeoffs.

> Is it a terrible idea to have LessonPresenter inherit from Lesson?

A: Strictly speaking in terms of OO, inheritance describes an "is-a" relationship, and you can't say that a lessonpresenter is a lesson, so introducing an inheritance chain is probably inappropriate. There is some duplication to this pattern. Typically a viewmodel exposes only the attributes needed to satisfy the needs of the view, and you'd fill them in from the corresponding model on construction.

While this seems on the surface to violate DRY (and be duplicate work), i'd argue that it's no more repetition than creating factories with the same attributes as models. Separate objects for separate purposes.

You could get away with hanging a lesson off of the presenter so that you could access it at the view level, but that's a law of demeter violation and breaks encapsulation.

You could do the method_missing bit and delegate to the object. that's slick and rubyish. Where that falls apart though is implementing this pattern across more than one model. Because we're not really building a "presenter for a lesson", we're building a presentation object for a view that represents the model data behind it.

Already this answer is complicated, but there's just always a lot of decisions that go into making architectural choices. It may be the case that for this one thing, creating a method on the Lesson itself is the "simplest thing that could possibly work" and satisfies one of our tenets of agile, and then we delay the big architectural choice until we need a second or third thing.

I support whichever choice you make (probably) as long as you have unit tests to support later refactoring :smile_cat:
