---
layout: post
title: "turbolinks"
date: 2013-09-25 10:27
comments: true
categories: rails4 turbolinks
---

Turbolinks replaces the body of the page but doesn't reload the header files. This limits the number of calls and makes the site appear faster to the user by a noticeable margin.

###To remove turbolinks for Rails 4
  - (3 steps from Steve Klabnik)[http://blog.steveklabnik.com/posts/2013-06-25-removing-turbolinks-from-rails-4]

###Breaking my JS
  - Turbolink breaks my JS calls when the page loads up the Facebook SDK. So I started disabling turbolinks on certain pages in my HAML a tag with the "data-no-turbolink" option `= link_to 'add friends', next_wizard_path, "data-no-turbolink" => "true"`
  - There are also events that one can hook into. They are (listed here)[https://github.com/rails/turbolinks/#events].
  - You can also put the click event on the doc rather than the element which will solve this issue. In this case ajax tasks would also have the click event applied to them as well.

```ruby Click Event on doc rather than element
$('document').on 'click', '.edit_task input[type=checkbox]', ->
    $(this).parent('form').submit()
```

###The jquery turbolinks gem
  - Using (the gem)[https://github.com/kossnocorp/jquery.turbolinks] just straight fixes it. This likely means that the turbolinks is disabled for all jquery related calls.


###Reading
  - a (basic summary by treehouse)[http://blog.teamtreehouse.com/rails-4-a-look-at-turbolinks]