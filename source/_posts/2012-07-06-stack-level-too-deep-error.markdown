---
layout: post
title: "Stack Level Too Deep Error"
date: 2012-07-02 10:52
comments: true
categories: ruby errors
---

This error generally happens when you accidentally recursively changing an attribute. If you have a username attribute in User model, and a virtual attribute named username, that is directly changing the username, you end up calling the virtual, the virtual calls the virtual again and so on.. Therefore, take a look on whether something like that happens somewhere in your code.

SEE: <http://stackoverflow.com/questions/5446055/stack-level-too-deep-error>