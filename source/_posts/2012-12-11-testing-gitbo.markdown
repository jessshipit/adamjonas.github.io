---
layout: post
title: "Testing Gitbo"
date: 2012-12-11 19:18
comments: true
categories: 
---

- [Factory Girl](https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md)

```ruby Defining Attributes in FactoryGirl
FactoryGirl.define do
  factory :user do
    provider "github"
    uid  "xxxx5826"
    name "Adam Jonas"
    nickname "ajonas04"
    email "francestown@gmail.com"
    image "string"
    token "xxxxx"
  end
end
```

`config.include FactoryGirl::Syntax::Methods`