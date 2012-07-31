---
layout: post
title: "Rake tasks"
date: 2012-07-31 11:54
comments: true
categories: rake heroku
---

```ruby This is a rake task file...
task :load_errors => :environment do
  AirbrakeError.import_from_airbrake
end
```

In heroku I would run this:
```
♕ heroku run rake load_errors
# NOT
♕ heroku run rake task bandaid
```