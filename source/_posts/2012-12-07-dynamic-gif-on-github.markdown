---
layout: post
title: "Dynamic GIF on Github"
date: 2012-12-07 13:06
comments: true
categories: 
---

1. How is the GIF embedded in the markdown?

2. Where can I see it?
  - TravisCI
  - The only .png match points to Repositories#show
  - `repo = service(:find_repo, params).run` -> line 31 in the repo controller, this must be how it is done.

3. How do we dynamically generate a png in ruby

###[Magick_title](https://github.com/citrus/magick_title#readme)
- `MagickTitle.say("Hello")` builds a PNG that predictably says "Hello"
- the gifs on github are 13 pixels tall

- 