---
layout: post
title: "polymorphic brain hurt"
date: 2014-08-21 17:38
comments: true
categories: polymorphic
---

## Polymorphic association from parent to child

So [this](http://blog.hasmanythrough.com/2006/4/3/polymorphic-through) succinctly summed up my issue. 


## Deprecated conditions in rails 4

`Deprecation warning when using has_many :through :uniq in Rails 4`

Then once I did get it working with:

```ruby Conditions Refactor
# lesson model
  has_many :readmes, :through => :lesson_contents, :source => :readme,
    :conditions => "lesson_contents.content_type = 'Readme'"

  has_many :labs, :through => :lesson_contents, :source => :lab,
    :conditions => "lesson_contents.content_type = 'Lab'"

# stabby lambda
  has_many :readmes, -> { where("content_type = 'Readme'") },
    :through => :lesson_contents, :source => :readme

  has_many :labs, -> { where("content_type = 'Lab'") }, :through =>
    :lesson_contents, :source => :lab
```

[Hat Tip](http://stackoverflow.com/a/16702101/1496757)


## Polymorphic Migration

```ruby Creating a [polymorphic migration](http://stackoverflow.com/a/5534614/1496757)
class AddImageableToProducts < ActiveRecord::Migration
  def up
    change_table :products do |t|
      t.references :imageable, :polymorphic => true
    end
  end
end
```
