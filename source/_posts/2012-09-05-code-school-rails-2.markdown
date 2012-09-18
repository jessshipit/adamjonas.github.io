---
layout: post
title: "Code School Rails 2"
date: 2012-09-05 15:00
comments: true
categories: 
---

```ruby Scopes
class Tweet < ActiveRecord::Base
  scope :recent, order('created_at desc').limit(4)
  scope :graveyard, where(show_location: true, location: "graveyard")
end
```

be careful of return values with callbacks. Once it hits a false, everything will halt.

```ruby Foreign Key Options
class Tweet < ActiveRecord::Base
  has_one :location, dependent: :destroy, foreign_key: :tweeter_id
end
```

n+1 query

```ruby Migration syntax
def change
  create_table(:categorizations) do |t|
    t.integer :tweet_id
    # there is no comma seperation here...
    t.integer :category_id
  end
end
```

belongs_to :singular
has_many :plaural

put and delete are hidden in the html 5 data-method 
This is all done with unobtrusive javascript

link_to 'All Zombies', zombies_path
link_to 'All Zombies', new_zombies_path
link_to 'Edit Zombies', edit_zombies_path(@zombie)
link_to 'Show Zombies', zombie_path(@zombie)
link_to 'Show Zombies', @zombie

```ruby
<h2><%= @zombie.name %>'s weapons</h2>
<ul>
  <% @weapons.each do |w| %>
    <li><%= link_to w.name, [@zombie, w] %></li>
    #the relative path shorthand is equal to 'link_to w.name, zombie_weapon_path(@zombie, w)'
  <% end %>
</ul>
#note that weapon is singular here...
<%= link_to "New Weapon", new_zombie_weapon_path(@zombie) %>
```
??I'm not really sure about the logic of passing in variables here. How do we know the order and what is appropriate?

same with form_for
```ruby
<%= form_for([@zombie, @weapon]) do |f| %>
```

Mad Mimi- gem integration for subscription lists

###Asset Pipeline###
app dir - app specific code
lib dir - shared code
vendor dir - 3rd party code

```ruby Call with assets-- it will check all the directories
assets/custom.js
assets/rails.png 
```

```ruby
def low_ammo(weapon, zombie)
  attachments["weapon.jpg"] = weapon.picture_file
  mail to: zombie.email, subject: "#{weapon.name} has low ammo"
end
```
[See](http://guides.rubyonrails.org/action_mailer_basics.html#sending-emails-with-attachments)

Asset Tags:
- auto_discovery_link_tag
- javascript_include_tag
- stylesheet_link_tag
- image_tag
- video_tag
- audio_tag
```ruby e.g.
<%= image_tag("weapon.jpg") %>
```

```ruby StyleSheet- referencing an image
h2#newUser {
  text-indent: -9999px; 

a {
  height: 64px;
  width: 50px;
  display: block;
  background: url(<%= asset_path("rails.png") %>) no-repeat;
  #created an asset path link because this file is erb....
}}
```

```coffeescript Syntax
$(document).ready ->
  $('#displayWeaponForm').click (event) ->
    event.preventDefault()
    $('#newWeapon').show()
    $(this).hide()
```

```ruby in the controller
class WeaponsController < ApplicationController
  def fire_weapon
    @weapon = Weapon.find(params[:id]) 
    @weapon.fire!
    if @weapon.low_ammo?
      render :fire_and_reload
    end
  end
end
```
If the 'if' conditionally is not met, it will fire the default show page which corresponds to the name of the definition

```ruby Custom Resource Routes
RailsForZombies::Application.routes.draw do
  resources :zombies do
    resources :weapons do
      put :toggle_condition, on: :member
      put :reload, on: :member
    end
  end
end
```
Here we are sending the entire @weapon object
```ruby Rendering JSON and options
class WeaponsController < ApplicationController 
  def create
    @weapon = Weapon.new(params[:weapon]) 
    if @weapon.save
    	#location option-- an API best practice on where to find the URL of the resource
      render json: @weapon, status: :created, location: @weapon
    else
      render json: @weapon.errors, status: :unprocessable_entity
    end
  end 
end
```
Here we are only interested in the ammo attribute of the weapon JSON object. This limits the amount of data we are sending. We don't want to send more than we need. *Data isn't free.*
```ruby Json with Options
class WeaponsController < ApplicationController
  def reload
    @weapon = Weapon.find(params[:id])
    if @weapon.ammo < 30
      @weapon.reload(params[:ammo_to_reload])
      render json: @weapon.to_json(only: :ammo), status: :ok
    else
      render json: @weapon.to_json(only: :ammo), status: :unprocessable_entity
    end
  end
end
```

```ruby More JSON options in the controller
  render json: @weapon.to_json(except: [:id, :created_at, :updated_at], include: :zombie)
```
*Important*
The JSON object you send back doesn't need to correspond to a real world object. The slow part is always opening up the connection. So you would rather send as much as you can per connection rather than send two requests.

###Routes###
there is a :member route
:  which acts on a single resource
There is a :collection route
:  which acts on a group of resouces

[as_json](http://api.rubyonrails.org/classes/ActiveModel/Serializers/JSON.html#method-i-as_json)
```ruby Nested Options in the Model
class Zombie < ActiveRecord::Base
  has_many :weapons
  def as_json(options=nil)
    super(options ||
    #this is obviously nested. a little counter intuitive on how this is set up
      {only: :name, include: {weapons: {only: [:ammo, :name]}}})
  end 
end
```

```javascript
$('#condition').text("<%= @weapon.condition %>").effect("highlight")
```

I have a bad habit of putting > in my equations which seem to break things...
```javascript
$('#ammo').text('<%= @weapon.ammo %>'); 
<% if @weapon.ammo >= 30 %>
  $('#reload_form').fadeOut(); 
<% end %>
```

###Coffee Script###
[Documentation](http://jashkenas.github.com/coffee-script/)
```coffeescript
$(document).ready ->  
  $('div#reload_form form').submit (event) -> 
    event.preventDefault()
    form = $(this)
    url = form.attr('action')
    ammo = $('#ammo_to_reload').val()

    $.ajax
      type: 'put'
      url: url
      data: {ammo_to_reload: ammo} 
      dataType: 'json'
      success: (json) ->
        $('#ammo').text(json.ammo).effect("highlight")
        $('#reload_form').fadeOut() if json.ammo >= 30
```

