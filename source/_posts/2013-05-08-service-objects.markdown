---
layout: post
title: "service objects"
date: 2013-05-08 10:00
comments: true
categories: 
---

##rails cast #398

###Modules
  - models may have lots of behavior that isn't related, so it probably doesn't belong in the model layer -> usually a result of pushing behavior from the controller to the model

    - create a concerns folder that lives in the models folder
      - possibly namespace the module in a class folder if only used for a specific model
    - change the autoload config path to include the concerns folder
    - include module in the model

```ruby
#namespace in class if only going to use it in that class
class User 
  module Authentication
    extend ActiveSupport::Concern

#this gets scoped to the context of the class when included
    included do 
      has_secure_password
    end

#this makes these class methods instead of instance methods
    module ClassMethods 
      def authenticate(username, password)
       #code
      end
    end
  end
end
```

  - Ryan Bates' [issues with modules](https://gist.github.com/ryanb/4172391)
  - [BOMM and GDD](http://stevenharman.net/bag-of-methods-module-and-grep-driven-development)
  - [7 ways to decompose fat models](http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/)

  - [*Chubby models*, a blog post by DHH](http://37signals.com/svn/posts/3372-put-chubby-models-on-a-diet-with-concerns)
    - in rails 4, the concerns folder will be created by default
    - "This approach to breaking up domain logic into concerns is similar in some ways to the DCI notion of Roles"

###Service Objects
  - we are in the habit of pushing behavior from the controller to the model, but often the behavior in the controller is nicely isolated. Sometimes we need a new kind of object commonly referred to as a *service object*. 
  - the service object gets it's own folder in the app folder and [looks like this](https://github.com/railscasts/398-service-objects/blob/master/auth-services/app/services/authentication.rb)
  - this puts all the action related behavior in one place and keeps the model focused on validations, accessibility, etc.
  - likely works best when we have a complex controller action that interacts with a complex model

  - **testing**: 
    - create a services level dir and and easily test the class directly similarly to how one would test the models

  - **Further Reading**
    - [Steve Lorek explains service objects](http://stevelorek.com/service-objects.html)