---
layout: post
title: "service objects versus concerns"
date: 2014-02-25 15:03
comments: true
categories: 
---

[I wrote this](/blog/service-objects/) last May. Obviously, [@scottcreynolds](https://github.com/scottcreynolds) doesn't think it sunk in.

We were writing a URL sanitizer that stripped the user's URL input of `http://` and `www` to store in the DB. Because we were using it for multiple models. I had viewed this "stipper" method as a behavior and thus had thought it belonged in the the DHH blessed concerns folder.

Scott disagreed:
>A concern or mixin should describe a **behavior** that is being given to the object. That's the "able" nomenclature. A behavior is something like "it can support tags" or "it can be authenticated with a devise token".

What I should have seen was this is a utility method. He writes:

>What was being created here is a utility or service method, intended to be used across any entity in the system that chooses to sanitize a url. This is not a behavior that the object has. Yes, you could go so far as to say "this object can sanitize its urls" but that's a bit of semantic gymnastics when what we're really describing is a **service object** - something that provides a service to any part of the system that requires it. In this case, scrubbing user input.

Something that may have helped me futher understand this was thinking about who was responsible for this sanitization. Is the Event object responsible for url sanitization?

>It might seem like a fine hair to split, but if we examine further, we see that we weren't really adding a common behavior to the `event` and `admin_user` classes. 

>The `parseable` module as designed only handled the case where the thing it was being mixed into had a field called `website`. Including it in `event` would have done absolutely nothing because that field doesn't exist. What an `event` does have, however, is a `registration_link`. Already, we can see that we haven't truly identified a common *behavior* so much as a common *need* - hence a service object.

>Finally, just in the naming we can tell that we're not really describing what we mean. If a class includes a module `parseable`, that include line, in English, reads `an admin user is parseable`. To me that means something significantly different than `before save, strip some characters out of a field`. The module being described didn't do what it claimed to do by its name.

These things seem small, but they're extremely important to care about because code bases grow and all you have in a dynamic language is your tests and your naming to help you understand the system a year from now. I could show you a rails project I just came into where no care was given to naming and structure, and you could spend days following the labyrinth of modules and classes and end up hoping the Minotaur finds you and eats you and spares you the hassle of figuring out what's going on.

So in short, use concerns when extracting common behavior (active record finders, authentication, etc). Use service objects when extracting common needs.

Finally, a note on tests. It's great we're doing the cucumber, and doing it well, but we still need tests at model and controller levels too. If you make a new class/module it should have a test file and some tests.
