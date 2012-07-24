---
layout: post
title: "Lecture 6- Rails"
date: 2012-07-23 19:08
comments: true
categories: rails lecture
---

if it has a belongs_to it has a foreign key...
e.g. songs belong to an artist, so it must have an artist_id



``` ruby
#the return value of this is all the songs 
aretha.song << Song.new(:name => "Natural Woman")
#this is just one song
respect = aretha.songs.build(:name => "Respect")
```

7:27
``` ruby 
favorites.mixtape_songs.build :song => Song.find_by_name("Thriller")
#these accomplish the same thing, but above is more expressive
favorites.songs << Song.first
```

the first level of keys in the params hash is usually scope. 

what is params?
- user passes in data through forms
- rails takes that data and makes it easy to access through forms

so *accepts_nested_attributes* is a way for you to specify that this model should accept data for its associations

field_for
f.fields_for :song_genres
is accessing params[:song][:song_genres]

###Select Boxes###
select(method, choices, options = {}, html_options = {})
``` ruby
<%= song_genre.select :genre_id, [
  ["Rap", 1]
  ["Pop", 2]
  ["Whatever", 3]
  ] %>
```
**Text Boxes**:
adding functionalty 

***classes are data and behavior***
we have added behavior to the song_genre model because this is the only place the genre_id is being stored. 

*LookUp* Ruby try method

``` ruby Delegate
delegate :name, :to => :genre, :prefix => true, :allow_nils => true
#the above macro is the same as the method below method.
def genre_name
  genre.name if genre
end
```

###Normalization###
the incision point for normalization are easy to do on writer. but if you are using a vanilla writer, then don't write a normalizer just to normalize. Use a gem or something.

```
:uniq
If true, duplicates will be omitted from the collection. Useful in conjunction with :through.
```
in general this goes on the through model... which doesn't make all that much sense, but that's how it goes on many to many relationships
This isn't preventing the creation of duplicates, it's just treating duplicates as singular-- total crap

8:15
Allow destroy
with a checkbox

###Validations###
```
#following valdiation rule is a constraint on the following attribute
validates :name, :length => {:minimum => 2, :maximum => 12}
validates :name, :uniqueness => { :scope => :song_id}
```
[See rails guides validations](http://guides.rubyonrails.org/active_record_validations_callbacks.html)
[specifically uniqueness](http://guides.rubyonrails.org/active_record_validations_callbacks.html#uniqueness)

###Technical Debt###
Technical debt (also known as design debt or code debt) is a neologistic metaphor referring to the eventual consequences of poor or evolving software architecture and software development within a codebase. The debt can be thought of as work that needs to be done before a particular job can be considered complete.

in console can call .valid? to debug and see if an object is valid.

###When debugging...###
try to reduce abstraction
-actually need to debug the problem at hand