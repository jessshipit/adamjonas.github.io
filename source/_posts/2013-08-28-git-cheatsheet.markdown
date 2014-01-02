---
layout: post
title: "Git Cheatsheet"
date: 2013-08-28 18:31
comments: true
categories: git
---

  - `git clean -f -d` removes all untracked files. `git reset --hard HEAD` won't remove untracked files.
  - `git checkout <filename>` untracks a file and returns it to its original state.
  - `git push -u origin my_branch` sets upstream. Here is a [good explanation](http://stackoverflow.com/questions/6089294/why-do-i-need-to-do-set-upstream-all-the-time).