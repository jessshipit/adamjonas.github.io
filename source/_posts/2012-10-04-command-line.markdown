---
layout: post
title: "Command Line"
date: 2012-10-04 16:01
comments: true
categories: CLI
---



To create multiple directories via the CLI using mkdir simply include the -p flag. For example, starting in home directory where 'development already exists run the following:

$ mkdir -p development/practice/learn_sql

To create multiple directories down the tree do this…

$ mkdir -p development/practice/learn_sql/{beginner,intermediate,advanced}

Learned this thanks to this friendly [blog post](http://technosophos.com/content/mkdir-creating-multiple-subdirectories-one-command)