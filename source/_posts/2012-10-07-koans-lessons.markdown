---
layout: post
title: "Koans Lessons"
date: 2012-10-07 21:53
comments: true
categories: 
---

```ruby
def test_accessing_hashes_with_fetch
    hash = { :one => "uno" }
    assert_equal "uno", hash.fetch(:one)
    assert_raise(KeyError) do
      hash.fetch(:uno)
    end

    # THINK ABOUT IT:
    #
    # Why might you want to use #fetch instead of #[] when accessing hash keys?

# answer: there are some instances where returning nil blindly from a hash can cause issues
  end

  # Bonus Question: Why was "expected" 
```

  
```ruby .merge will rewrite values that you had :keys for. 
hash = { "jim" => 53, "amy" => 20, "dan" => 23 }
#=> {"jim"=>53, "amy"=>20, "dan"=>23}

new_hash = hash.merge({ "jim" => 54, "jenny" => 26 })
=> {"jim"=>54, "amy"=>20, "dan"=>23, "jenny"=>26}
```

```ruby Default values
hash2 = Hash.new("dos")
#every default value is now "dos"
```

# THINK ABOUT IT:
  #
  # The two major ways to write class methods are:
  #   class Demo
  #     def self.method
  #     end
  #
  #     class << self
  #       def class_methods
  #       end
  #     end
  #   end
  #
  # Which do you prefer and why?
  # Are there times you might prefer one over the other?

   def test_method_names_become_symbols
    symbols_as_strings = Symbol.all_symbols.map { |x| x.to_s }
    assert_equal true, symbols_as_strings.include?("test_method_names_become_symbols")
  end

  # THINK ABOUT IT:
  #
  # Why do we convert the list of symbols to strings and then compare
  # against the string value rather than against symbols?


  # QUESTION: Which has precedence: The constant in the lexical scope,
  # or the constant from the inheritance hierarchy? lexical scope