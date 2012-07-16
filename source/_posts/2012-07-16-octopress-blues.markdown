---
layout: post
title: "octopress blues"
date: 2012-07-16 16:53
comments: true
categories: octopress errors
---

I just spent more than an hour debugging an issue when trying to run
```
rake generate
```
The error I kept receiving was:
```
## Generating Site with Jekyll
unchanged sass/screen.scss
Configuration from /Users/Ajonas/octopress/_config.yml
Building site: source -> public
/Users/Ajonas/.rvm/gems/ruby-1.9.2-p320/gems/rubypython-0.5.3/lib/rubypython/rubypyproxy.rb:198:in `method_missing': ClassNotFound: no lexer for alias 'Query' found (RubyPython::PythonError)
	from /Users/Ajonas/.rvm/gems/ruby-1.9.2-p320/gems/pygments.rb-0.2.13/lib/pygments/ffi.rb:135:in `lexer_for'
	from /Users/Ajonas/.rvm/gems/ruby-1.9.2-p320/gems/pygments.rb-0.2.13/lib/pygments/ffi.rb:91:in `highlight'
	from /Users/Ajonas/octopress/plugins/pygments_code.rb:24:in `pygments'
	from /Users/Ajonas/octopress/plugins/pygments_code.rb:14:in `highlight'
```
It goes on much longer from there. Anyways, I googled it and found [this](http://samrange.com/blog/2012/06/17/octopress-code-highlighting-with-arch-linux/) which sent me on a wild goose chase to change out the path in the rubypython gem file. 

After trying to fix this, I decided to generate some other posts. What I discovered was other posts could be generated and pushed which meant it wasn't the gem at all...

In the end, I hadn't named the language of the code snippet so the post couldn't be generated.

Ugh.