---
layout: post
title: "Lecture 5- Rails"
date: 2012-07-22 14:18
comments: true
categories: rails lecture forms
---

Rails Lecture 4- July 22


In the migration:
``` ruby In the migration
def change
  add_column :songs, :album_id, :integer

#should probably make the below code in the rake tasks (in seed/tasks)
  songs = Song.all

  songs.each do |s|
    album= Album.find_or_create_by_name(s.album_name.string)
    #update those songs to relate to that album
    puts "UPdating song #{s.id} to album #{album.id}..."
    s.album= album
    s.save
  end
  remove_column :songs, :album_name
 end
end
```

Some other methods:

find_each method: look it up in guides [here](http://guides.rubyonrails.org/active_record_querying.html).
find_each yields each individual object one at a time
find_in_batches it yields songs

in the seeds file:
``` ruby Examples
aretha = Song.create :name => "Aretha Franklin"
respect = aretha.songs.build :name => "Respect"
aretha.save

#many to one, the reverse of above
monster = Song.create :name => "Monster"
monster.build_artist name => "Kanye West"
monster.save

aretha.songs << Song.new(:name => "Natural Woman")
#unintentional performance issue here because it loads the full array
#in order to push one song into it

kanye = Artist.find_by_name => "Kanye West"
kanye.songs << Song.new(:name => "Home")

michael = Artist.create :name => "Michael Jackson"

michael.songs << ("Black and white", "Thriller", "beat it").collect do |song_name|
# need collect instead of each method b/c need the return
  song.create :name => song_name
end

michael.songs.delete(Song.find_by_name("Black and white", "Thriller", "beat it"))
end
```

This will output the log output of the rake tasks:
```
tail -f log/development.log
```

update the forms in the application (2:50)

Shortcut: cmd D shortcut to highlight similar words to edit


errors:
when you get a stack trace and it's part of rails you can ignore it because you created the file NOT rails.

###has_many :through### (2:58)
artists have many albums through their songs
- a many to many association

if a model has 2 :belongs_to associations means that it is a join table
even though it is a join model is has all the same behaviors as a has_many assoc

INNER JOIN is SQL:
The INNER JOIN keyword return rows when there is at least one match in both tables.


###Foreign Key/ belongs_to RULE###
if it belongs_to xyz it is a foreign key. if it is a foreign key than it belongs_to xyz.

``` ruby Seeds File from the lab
  avi = User.create :name => "Avi"
  favorites = Mixtape.create :name => "Avi's favs"

  avi.mixtapes << favorites
  
  black_and_white = michael.songs.first
  black_and_white.genres.build #when it's a many it is genres.build
  #singular is build_genre
  black_and_white.save

  favorites.songs << black_and_white
  favorites.mixtape_songs.build :song => Song.find_by_name("Thriller")
  #(4:34)
  #if you understand :belongs_to and has_many it doesn't matter if it's a :through

  UserMixtape.create(
    :user => User.create(:name => "Roland"),
    :mixtape => favorites
    )
```

###Forms###
**How do we build forms that give users the same abilities we have through forms?**
If a field name end in an [], it will allow multiple fields and rails will treat it as unique values and glob them together in a params array (4:46)
- If you want to have multiple fields anem it with an empty array

in the mixtapes_controller
``` ruby
@mixtape.songs << Song.find(params[:song_ids])

#this would also work
params[:song_ids].each do |song_id|
  @mixtape.mixtape_songs.build :song => song_id
end
 
Next level of abstraction up... (4:55)
in the html we want to pass in:
mixtape[song_ids][]

Mass assignment is this accordian of 
a writer method implies an attribute of a model
**Main goal as a programmer** name your data so that it is easily accessbile in params

TODO (5:03)
HTML:
scope, attribute, attribute kind

###form_tag helper###
NEXT: *A rails implementation: form_tag helper*, a low level rails helper
all these methods do is generate html for you. not all that railsy.
```
<%= form_tag mixtapes_path do %>
```
At least we aren't writing HTML here now... this level of implementation gives you lots of flexibility and control but at the expense of maintainability and explicitness.

###form helper builders###
*html, form_tag helpers family, form helpers in order of low level of abstraction to higher*
want to bind the active record object to the form element
e.g. text_field, label
(5:17)
``` ruby
<%= label :mixtape, :name %> #:mixtape represents @mixtape, but rails doesn't support @mixtape
<%= text_field :mixtape, :name %>
```

###form_for###
We want to bind the instance var to the form itself
- the problem with text_field is that hte form is still built without any knowledge of the active record instance behind the form --> it should be an extension of the object
- these are the way our scaffolds normally work

form_for method yields a form builderthat knows the model the form is about

mixtape_form.object would return the mixtape object because it has knowledge of the form object

you also get access to *fields_for* - 
``` ruby
mixtape_form.fields_for :mixtape_songs, @mixtape.mixtape_songs.build, :index => 0 do 
|mixtape_songs_field| #index option will increment them automatically
  mixtape_songs_fields_for.label :song_id
  mixtape_songs_fields_for.text_field :song_id
 end
```
Does your model implement a method called "mixtape_songs_attributes="
``` ruby
accepts_nested_attributes_for :mixtape_songs
#builds this method:
 def mixtape_songs_attributes=(attributes)
   attributes.each do |attribute_has|
   MixtapeSong.build.attribute_has
 end   
# this assigns the attributes of the mixtape_songs

#this is the same as
def mixtape_songs_attributes=(attributes)
   attributes.each do |index, mixtape_song_attributes|
     MixtapeSong.new :song_id = mixtape_song_attributes[:song_id]
   end
end
```

[Read](http://masonoise.wordpress.com/2010/07/23/rails-and-forms-using-accepts_nested_attributes_for/)
[railscast](http://railscasts.com/episodes/196-nested-model-form-part-1)
[ascii casts](http://asciicasts.com/episodes/196-nested-model-form-part-1)

**an attribute has a getter and setter method called the name of the attribute**

Rails Casts on this subject:
[Many to Many](http://railscasts.com/episodes/47-two-many-to-many/)

[Complex Forms - 1](http://railscasts.com/episodes/73-complex-forms-part-1/)

[Complex Forms - 2](http://railscasts.com/episodes/74-complex-forms-part-2/)

[Complex Forms - 3](http://railscasts.com/episodes/75-complex-forms-part-3)

[Nested models 1](http://railscasts.com/episodes/196-nested-model-form-part-1)

[Nested Models- revised](http://railscasts.com/episodes/196-nested-model-form-revised)

http://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html