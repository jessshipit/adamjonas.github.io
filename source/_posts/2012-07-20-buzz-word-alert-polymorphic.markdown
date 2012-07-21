---
layout: post
title: "Buzz Word Alert: Polymorphic"
date: 2012-07-20 17:57
comments: true
categories: terms rails associations TODO
---

###Polymorphism###

- “is the ability of objects belonging to different types to respond to method calls of the same name, each one according to an appropriate type-specific behaviour.” (wikipedia)
-is a language feature that allows the same function call to be associated with different definitions during the same execution, by delaying the binding of the call to run-time. [here](http://cs.calvin.edu/curriculum/cs/214/adams/labs/10/)

###Polymorphic Associations###
- in the [guides](http://guides.rubyonrails.org/association_basics.html#polymorphic-associations) it states: "With polymorphic associations, a model can belong to more than one other model, on a single association." 
- You can think of a polymorphic belongs_to declaration as setting up an interface that any other model can use. 

As usual Ryan Bates to the rescue-- [polymorphic association rails cast.](http://railscasts.com/episodes/154-polymorphic-association?view=comments)

Imagine an event website. We want to add a comments section. How would be do this because comments would belong to either the photo, article, or event. 
Without polymorphic associations we would probably try to create a model for each instance-- a photo comment, an article comment and an event comment. That's 3 models with the same data and behavior so we want to combine these into one generic comment model that can belong_to any of these other models.

``` ruby
rails generate scaffold comment content:text commentable_id:integer commentable_type:string
```

A *polymorphic association* is an association that can belong_to many different models...

``` ruby Polymorphic Association
class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
end
```
The rails docs refer to the :as keyword parameter to has_one and has_many as specifying a “polymorphic interface.”

At the database level, the Comment table will have two columns for the association: commentable_type and commentable_id. *A composite foreign key.*


To set up the other side of the association:
``` ruby 
class Article < ActiveRecord::Base
  has_many :comments, :as => :commentable #the :as => :commentable indicates the PolyMorph assoc
end
# similar code would be repeated for all of the associations-- in this case event & photo
```
So the polymorphic bit means that the type of thing you’re going to get back when you ask a Comment for its commentable data is unknown... it could be an article or it could be an event or it could be a photo. In dynamic Ruby land, Ruby terms, this means I don’t care what I sort of model I get when I ask a comment for its commentable data, as long as it goes quack I can treat it like it’s a duck.

Enter *interfaces*. Interfaces specify what I want the returned object to behave like, it could be a duck, or it could be a spaceship or maybe, just maybe, it could be commentable. In fact if you read though the ActiveRecord docs on polymorphic associations, you will find that “interface” is exactly what they call the parameter passed in the :as key of the params hash, and the first parameter to a polymorphic belongs_to association, and even the xxx_type and xxx_id columns in the database. This threw me quite a bit when I first looked at polymorphic associations, you have to declare that the association uses the commentable interface, but you don’t have a commentable model, or a commentable table, or a commentable anything for that matter. To my mind, "commentable" is the name of the interface that the comments all have to implement. It could specify that all of them must have a “next_comment” method, which will give me (surprise surprise) the next comment they produce. [(Read more on this)](http://wildfalcon.com/archives/2008/04/30/polymorphic-associations-and-interfaces-in-rubyrails/)

My comment model does not need to be changed when I add another commentable type. This is important. Very important! As soon as anyone with even a mild case of featuritus gets near your code they are going to want to add stuff, and more often that not, that will mean adding new classes. If adding new classes means adding new branches to all your conditional logic, you are in trouble. [See here again](http://wildfalcon.com/archives/2008/04/30/polymorphic-associations-and-interfaces-in-rubyrails/)

Once the associations are wired, how can we use this in the controller and views?
- For the most part, this can be treated like any other has_many association. e.g. can call article.comments to list all the comments of the article.
- A lot of confusion can arise if you are doing nested resources

Need to change the routes:
``` ruby
map.resources :articles, :has_many => :comments
map.resources :photos, :has_many => :comments
map.resources :events, :has_many => :comments
```

At the end of the comment controller, Ryan adds the find_commentable method:
``` ruby
private

def find_commentable
  params.each do |name, value|
    if name =~ /(.+)_id$/
      return $1.classify.constantize.find(value)
    end
  end
  nil
end
```

###Beyond the rails cast###
[Charles Max Wood's explanation](http://teachmetocode.com/articles/ruby-on-rails-what-are-polymorphic-associations/)

Polymorphic associations allow us to associate a single attribute of the class to any number of specified classes.
Charles suggest that you [put your polymorphic associations and related functionality into mixin modules](http://teachmetocode.com/articles/ruby-on-rails-polymorphic-associations-with-mixin-modules/).
[Youtube Video](http://www.youtube.com/watch?v=9NiCx1Lu-DY)-
Polymorphic means that it can take different forms. A comment can belong_to a page or a post. Most devs name this ___able. e.g. for a comment it would be commentable. This just a convention.

On the has_many side this becomes a little muddy: if commentable can be a page or a post then a comment, it's going to go looking for a page ID on the comments table and it's not going to find it. So the solution is:
``` ruby
has_many :comments, :as => :commentable
#saying: i have many comments and the comments refer to me as commentable
```
 If you have a belongs_to :commentable on your comment, you are going to expect it to have a commentable_id on the comments table (which it does!). But is that _id a post.id page.id? This is answers by having a commentable type column as well on the comments table-- it's a string column that stores the class name for whatever is associated there (i.e. post or page). So when you invoke joins or includes it has to go looking for the type column of commentable type.

Note: many to many polymorphic associations don't seem to work very well
There is a video on this [here](http://www.youtube.com/watch?v=vEo6hmHTvS4).


[The beginning of this is worth a read](http://robots.thoughtbot.com/post/159809241/whats-the-deal-with-rails-polymorphic-associations)... even if it's from 2006.