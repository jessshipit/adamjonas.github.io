---
layout: post
title: "Lecture 2 Rails"
date: 2012-07-08 14:21
comments: true
categories: rails lecture notes
---

***Lecture 2***

BASH
```
cd .. # change to up a directory
cd . # change to current directory
ls # list
cd ~ #home directory
```

___Resources___
- the thing you want to let users manipulate
```
rails generate resource Mixtape nae:string
```

Rake-
a ruby language for running scripts

Models-
main component of your application, they represent the resources of your application
every model is just a ruby class definition located in the model

so the mixtape model defines a class Mixtape that is the object that will allow our app to CRUD mixtapes

If we a Users model we have a users table

Goal for today is to understand the request cycle

***Routes***

***DSL- Domain Specific Language*** (3:08PM)
``` ruby
match '/foo' => 'songs#foo' # this needs to be sent to a controller
# a songs controller with the foo action
```
we need to find something that can handle the route--> we want to send it to a waiter, like ordering an A7 at a chinese resturant

**an ACTION is just a method defined in the class!!**
a Controller is just a class --> a grouping that relates to songs

if it can't find a page it is 404

every action in the app needs to be defined

5 keywords available...
MATCH
GET
POST 
PUT
DELETE

cmd T --> opens a window for you to access files

***rake routes:***
first column is the request
second is http verb
third is url or pattern
fourth is the contoller#action

resources macro- defines all the restful actions for the resource

?? so what was the main problem with the post request?

***Controllers & \#actions ***

``` ruby e.g. of actions in the Songs controller
def name 
  render :template => 'songs/name' #explicit template rendering
end

# exactly the same as this...
def name
end
```

``` ruby Renders
render :action => "name" # in the views folder named after the controller
render :template => 'songs/name' # need to specify the full path
render :xml
render :json
```

Video 2 starts 4PM
diff between <% and =<% 
<% will get executed, but will not show in the html
<%= will get executed and will also show in the html

*** Instance variables ***
Instance variables are the only thing passed from the controller to the views
??? do class variables get passed as well?

**link_to**
``` ruby
<%= link_to 'Search', 'http://google.com' %>
```
we have two methods _path and _url

``` ruby e.g. of link_to
<%= link_to 'Show', 'song' %> #polymorphic interface 
```

3 pars of rails (4:10 PM)
ORM- active record
Action controller
Action view

LEARN MORE: there are lots of polymorphic interfaces play nicely with active record

``` ruby automatic routing with namespacing with_options
with_options :controller => 'site' do |s|
  s.get 'about'
  s.get 'home'
end
```