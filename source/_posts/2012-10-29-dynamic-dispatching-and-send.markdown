---
layout: post
title: "Dynamic Dispatching &amp; Send"
date: 2012-10-29 15:32
comments: true
categories: ruby
---

Given a file with...
```
admin : Bill
title : Rubyland
topic : Ruby and more
```
You could build a method that maps the keys and values with dynamic dispatching...
```ruby
# Load configuration if any
if conf.rc and File.exists?( conf.rc )
  YAML.load_file(conf.rc).each do |k,v|
    conf.send("#{k}=", v) #the beauty of dynamic dispatching in motion
  end
end
```
(this e.g. is from page 68 of the Prag Programmer's Metapramming Book)

```ruby This code needs to be much more DRY
class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end
 
  def mouse
    info = @data_source.get_mouse_info(@id)
    price = @data_source.get_mouse_price(@id)
    result = "Mouse: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end
 
  def cpu
    info = @data_source.get_cpu_info(@id)
    price = @data_source.get_cpu_price(@id)
    result = "Cpu: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end
 
  def keyboard
    info = @data_source.get_keyboard_info(@id)
    price = @data_source.get_keyboard_price(@id)
    result = "Keyboard: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end
 
  # ...
end
```

This is much cleaner
```ruby Refactored with simple interpolation
class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end
 
  def self.define_component(name)
    define_method(name) do
      info = @data_source.send "get_#{name}_info", @id
      price = @data_source.send "get_#{name}_price", @id
      result = "#{name.to_s.capitalize}: #{info} ($#{price})"
      return "* #{result}" if price >= 100
      result
    end
  end
   
  define_component :mouse
  define_component :cpu
  define_component :keyboard
end
```