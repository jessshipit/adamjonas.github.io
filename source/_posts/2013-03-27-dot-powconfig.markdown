---
layout: post
title: ".powconfig"
date: 2013-03-27 11:27
comments: true
categories: 
---

```ruby .powconfig
eval $(rbenv init -)

export POW_DOMAINS=dev,test

#because I loaded pow with brew and not manually it was a different path...
export PATH="/usr/local/opt/rbenv/shims:$PATH"

export POW_TIMEOUT=900
export POW_WORKERS=1
```