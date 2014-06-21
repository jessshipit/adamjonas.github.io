---
layout: post
title: "rspec keywords"
date: 2014-05-08 14:24
comments: true
categories: rspec
---

Feedback on my misuse of rspec keywords (and `context` in particular):

  - `Context` describes an execution context, or an arrangement of the system, not an action. 
  - It helps to always think of `context` blocks in terms of "when ..." and it is usual to begin `contexts` with a when.

The layout is like this:

  - `describe` some system/class/function
    - `context` "when condition A is true about the system"
      - it "behaves thusly"
    - context "when condition B is true about the system"
      - it "behaves thusly"

A classic example might be:

```ruby
describe SomeController do
  describe "GET new" do
    context "when logged in" do
      it "renders this page"
    end
    context "when admin" do
      it "renders this other page"
    end
    context "when visitor" do
      it "redirects to login"
    end
  end
end
```
