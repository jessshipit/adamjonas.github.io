---
layout: post
title: "Cucumber with Scott"
date: 2014-02-17 15:09
comments: true
categories: 
---


The point of BDD is to build a system form a perspective of a user, rather than just as a developer.

## Login
As a partner, I need to be able to login, so that I can update my upcoming events.

Need to deliver a story and prove that it works.

An integration test is any test that cross the boundries of a system

### Why cucumber
  - Gherkin language for feature files
  - rspec for tests
  - capybara to drive the browser

The tools are the same just when with gherkin thrown on top
  - cucumber is platform and language agnostic

So a problem I have is when to test built in features of the framework or gem.

## Given, When, Then
  - same as Arrage, Act, Assert (which is what ALL tests do) in people talk

  - Arrage

    `let(:something) {do_something}`

```ruby
before do
  arrange_things
end
```

  - Act, and Assert

```ruby
it "does something when I do this" do
  do_a_thing #=> act
  expect(that_thing).to eq(something) #=> assert
end
```

### Misc
  - user regex in the step file if you are going to reuse it
  - acceptance tests should be used to test large swatches rather than every permuation

### tags
  - `@pause` like a binding
  - `@wip` won't run unless specified to run
  - custom tags work too, so even then you'd run it with `cucumber -t @jonas`
  - or you can run multiple tags at one time, e.g. `cucumber --tags @billing,@important`
