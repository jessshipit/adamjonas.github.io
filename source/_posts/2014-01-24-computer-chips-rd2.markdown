---
layout: post
title: "computer chips rd2"
date: 2014-01-24 12:55
comments: true
categories: devise
---

###Devise
  1. ran into issues with rails 4 strong parameters. [See](https://github.com/plataformatec/devise/#strong-parameters)
  2. Then my user edit form was not writing to the DB because the [update_resource method](https://github.com/plataformatec/devise/blob/master/app/controllers/devise/registrations_controller.rb#L88) requires a current password parameter passed along
    - one [can override this default behavior](https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-edit-their-account-without-providing-a-password)


###State Machine Transitions
  - ended up going with [transitions](https://github.com/troessner/transitions)
