---
layout: post
title: "Lecture 7 -Rails"
date: 2012-07-29 14:20
comments: true
categories: rails lecture_notes
---

``` ruby Song class
def genre_name
  self.genres.collect{|g| g.name.join(",")}
end

def genre_name=(str)
  str.split(",").collect{|s| s.downcase.strip}.
    SongGenre.new(:genre => Genre.find_or_create_by_name(genre_name))
  end
end
```

an album has many songs... which means the accepts nested attributes for will be a good fit

###Nested Resource###
begins with the routes

[Nested Model Form Rails Cast](http://railscasts.com/episodes/196-nested-model-form-part-1)

[***Dont' use nested attributes for a belongs_to association***](http://blog.aviflombaum.com/blog/2012/07/dont-use-accepts-nested-attributes-for-with-belongs-to/)

mass assignment and the .build(params[:user_name])

Form_for (2:40)

###Layouts and Sub-layouts###
``` ruby On the Index Page
<% content_for :sub_nav do %>
  <%= link_to "New Song", new_song_path %>
 <% end %>
 # this could also be on the show page so they would share this sub_nav
 <nav class="sub_nav">
  <%= yield :sub_nav %>
 <% end %>
 # this works because you create another yield in the app besides the body
```
you can open up a sublayout as many times as you want to add links...

[link_to_unless_current](http://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-link_to_unless_current)- it just creates the title, not the link to its own page... useful for nav bars

polymorphic interfaces: depending on the argument that you send it, it has different behavior
when you send @mixtape it looks up:
``` ruby
mixtape_path(@mixtape) #=> '/mixtapes/1'
```
real life e.g.s
subway slot can accept a metrocard and a credit card-- depending on what you send it, it has differnt behavior
a vending machine accepts dollar bills and credit card. Depending on what you insert, it has different behavior.

render is another flexible polymorphic object-
``` ruby Rending Partials in a Collection- very important
<%= render @mixtape.songs %>
#Down a level of abstraction since it reveals the collection and partial:
<%= render :collection => @mixtape.songs, :partial => songs/song_li', :as => :song %>
```

``` ruby Cast Variables
<%= render 'songs/fields', :f => song_form %>
```
If skip album name is true, then
(3:40)
``` ruby
<% if include_album_name %>
  <div class="field">
  	<% f.label :album %> <br />#more code....
```

[Passing Local Variables into Partials](http://guides.rubyonrails.org/layouts_and_rendering.html#asset-tag-helpers)... need to scroll down a little


write_attribute

[5 ways to set attributes in ActiveRecord](http://www.davidverhasselt.com/2011/06/28/5-ways-to-set-attributes-in-activerecord/)

Could use callbacks and lifecycle hooks to normalize as well...
```ruby
before_validate :normalize_name

def normalize_name
  self.name = self.name.downcase.strip
end
```
