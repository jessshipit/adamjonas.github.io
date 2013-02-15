---
layout: post
title: "MacPro Set Up"
date: 2013-02-06 13:26
comments: true
categories: setup
---

- My postgres paths were screwed up. [This helped](http://stackoverflow.com/questions/12028037/postgres-app-could-not-start-on-port-5432/13847738#13847738)

- need to install bundler for every ruby install

- Pow path was screwed up. Need to create and set paths in `.powconfig` file.

- needed to rm symlink for git completion per the discussion [here](https://github.com/mxcl/homebrew/issues/16992#issuecomment-13162321)

- opens up the same terminal tab in a new window...

```
#opens new tab in same dir
precmd () {print -Pn "\e]2; %~/ \a"}
preexec () {print -Pn "\e]2; %~/ \a"}
```