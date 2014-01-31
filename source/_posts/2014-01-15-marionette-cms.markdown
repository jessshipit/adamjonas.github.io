---
layout: post
title: "marionette-cms"
date: 2014-01-15 16:59
comments: true
categories: marionette
---

### Jade template
  `<%- %>` insert into DOM
  `<%= %>` html escapes?

### Markdown
  - so apparently markdown doesn't come standard? I installed [marked](https://github.com/chjj/marked) as the markdown interpreter.
    - with an install with npm this gave immediate markdown functionality to the jade templates, but it was still required in the specific model in order to call markdown related functions on a string of markdown within the template helper.
  - I also need to translate the modifications made to the HTML on the page to be translated back into markdown to store them on the server. This required another plugin and I settled on [html.md](https://github.com/neocotic/html.md). The install was clean and worked smoothly from the start.

### `This` in the view
  - something that was not immediately apparent was the fact that `this` has different meanings in the template helper versus `onRender` for example.
