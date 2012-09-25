---
layout: post
title: "Rails Unit Testing"
date: 2012-09-24 13:20
comments: true
categories: testing codeschool
---

###Rails Testing###
- Verification Testing
- Test First
- Test Driven Design

###Unit Testing###
- Piecing of our applications in isolation from other parts
- Easy to debug
- Leads to good documentation

WHY TEST::UNIT rather than RSPEC
- More basic testing library and what rails uses by default
- similar to other testing libraries from other languages

```ruby Assert List
assert <conditional>
assert_equal <expected>, <actual>
assert_not_equal
assert_respond_to <object>, :<method>
assert_nil <object>
assert_not_nil <object>
assert_match <pattern>, <string>
assert_no_match <pattern>, <string>
assert_raise(<error>) { <code to raise error> }
assert_kind_of(<Class>, <object>)
```

```ruby
<subject>_test.rb

require "test/unit"

class <Subject>Test < Test::Unit::TestCase
	def test_<what_we_are_testing>
		<assertion>
	end
end

#E.g.
require "test/unit"

class BooleanTest < Test::Unit::TestCase
	def test_true_is_true
	#the 2nd parameter is puts on failure.
		assert true, "True should be truthy"
	end
end

#another e.g.
require 'test/unit'

class ConditionalTest < Test::Unit::TestCase
  def test_one_is_greater_than_one 
    assert 1 > 0, "One is not greater than zero"
  end
end

#e.g.
class MultipleTest < Test::Unit::TestCase
  def test_multiple_of
    assert Multiple.multiple_of?(10, 5), "10 should be a multiple of 5"
  end
end
```

*The best tests have one assertion.*

###Red, Green, Refactor###
1. Red: Write a failing test
2. Green: Write enough code to make it pass
3. Refactor: Refactor your code

```ruby assert_respond_to
def test_humanize_function_added_to_string
# assert_respond_to <object>, <:method>
  assert_respond_to "blah", :humanize
end
```

```ruby Assert_match
class ZombifierTest < Test::Unit::TestCase
  def test_zombify_brains
    z = Zombifier.new('I love your arms')
    #assert_match <regex>, <string>
    assert_match /brains/, z.zombify.humanize
  end
end
```

```ruby
class ZombifierTest < Test::Unit::TestCase
  def test_zombify_upcase
    z = Zombifier.new("Hello world").zombify
    #assert_equal "<expected string>", "<actual string>"
    assert_equal "HELLO WORLD BRAINS", z
  end
end
```

```ruby assert_raise
  #assert_raise(RuntimeError) { "zombie".humanize }
class ZombifierTest < Test::Unit::TestCase
  def test_brains_in_zombify_raises_error
    z = Zombifier.new('BRAINS')
    assert_raise(RuntimeError) { z.zombify }
  end
end
```

```ruby
class ZombifierTest < Test::Unit::TestCase
  def test_zombify_returns_a_string
    z = Zombifier.new('I like knees')
   #assert_kind_of(<Class>, <object>)
    assert_kind_of(String, z.zombify)
  end
end
```