---
layout: post
title: "circle ci debugging"
date: 2014-11-26 15:02
comments: true
categories: bugs
---

Chasing a crazy bug on circle ci. Passes locally. Used VNC to drop into circle ci to try to track it down. Really cool to get into that box but it didn't shed any light on the error.

The next step was to capture screenshots of what was going on. [The capybara-screenshot gem](https://github.com/mattheworiordan/capybara-screenshot) was a perfect fit but the screen shot was not showing the element actually being tested. For some reason it just wasn't being displayed. It clicked that the window width was at tablet size meaning the element was being hidden by a media query. Shit.

Resolution:

  - [Resizing a window to resize](http://yizeng.me/2014/02/23/how-to-get-window-size-resize-or-maximize-window-using-selenium-webdriver/#ruby-example)
  - [Selenium Ruby Bindings](https://code.google.com/p/selenium/wiki/RubyBindings)
