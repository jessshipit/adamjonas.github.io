---
layout: post
title: "Cross Site Request Forgery"
date: 2012-07-21 13:08
comments: true
categories: rails TODO
---

###Cross Site Request Forgery###


Description Summary
:  The web application does not, or can not, sufficiently verify whether a well-formed, valid, consistent request was intentionally provided by the user who submitted the request.

Extended Description
:  When a web server is designed to receive a request from a client without any mechanism for verifying that it was intentionally sent, then it might be possible for an attacker to trick a client into making an unintentional request to the web server which will be treated as an authentic request. This can be done via a URL, image load, XMLHttpRequest, etc. and can result in exposure of data or unintended code execution.

Ensures that information submitted through forms have a specific tag that identifies it as information submitted through the form I created. (Read more about csrf [here](http://stackoverflow.com/questions/941594/understand-rails-authenticity-token) and [here.](http://stackoverflow.com/questions/9996665/rails-how-does-csrf-meta-tag-work)



This is the out of context code I have from class...
```
csrf metatabs
```

NOTE: We went over this in lecture 6 of ROR spring