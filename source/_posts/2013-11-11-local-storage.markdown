---
layout: post
title: "Local Storage"
date: 2013-11-11 15:38
comments: true
categories: local_storage
---


###From KCA
  - used [store.js](https://github.com/marcuswestin/store.js)
  - nice [little screencast](http://javascriptplayground.com/blog/2012/06/javascript-local-storage-store-js-tutorial)
  - here is an [older article](http://coding.smashingmagazine.com/2010/10/11/local-storage-and-how-to-use-it/) from 2010
  - *NOTE:* We ended up using [store.js with json](https://github.com/marcuswestin/store.js/blob/master/store%2Bjson2.min.js) because ie7 apparently doesn't come equiped with JSON. Tom and I broke our heads trying to figure out why `store.enabled` wasn't `true` for ie7. It came down to the fact that ie7 didn't have JSON.

Thought this was a cool little way to store whether a td square had been clicked on...
```
addRedTiles: ->
  selected = store.get("board_#{@board_id}")

  for tile_number in selected
    $("[data-title-num=#{tile_number}]").addClass('clicked_space')


duringBoardClick: ->
  if store.enabled
    $('td').click =>
      $(event.target).toggleClass('clicked_space')
      clicked_tiles = []
      all_clicked = $('td.clicked_space')

      for tile in all_clicked
        clicked_tiles.push $(tile).attr('data-title-num')

      store.set("board_#{@board_id}", clicked_tiles)
  else
    console?.log? 'store is not enabled'
```

```javascript This needed to be updated b/c of event.targer
duringBoardClick: ->
  if store.enabled

    board_id = @board_id
    \\notice that I declared the above variable
    $('td').click -> \\and changed this to a single ->
      $(@).toggleClass('clicked_space')
      clicked_tiles = []
      all_clicked = $('td.clicked_space')

      for tile in all_clicked
        clicked_tiles.push $(tile).attr('data-title-num')

      store.set("board_#{board_id}", clicked_tiles)
      \\board then becomes a local
  else
    console?.log? 'store is not enabled' 
```

###local storage versus cookies
  - **client versus server** -> Cookies and local storage really serve difference purposes. Cookies are primarily for reading server-side, local storage can only be read client-side. So the question is, in your app, who needs this data — the client or the server? If it's your client (your JavaScript), then by all means switch. You're wasting bandwidth by sending all the data in each HTTP header. If it's your server, local storage isn't so useful because you'd have to forward the data along somehow (with Ajax or hidden form fields or something). This might be okay if the server only needs a small subset of the total data for each request.
  - **Size** -> Apart from being an old way of saving data, Cookies give you a limit of 4096 bytes (4095, actually) - its per cookie. Local Storage is as big as 5MB per domain.
  - you can test your local storage [here](http://arty.name/localstorage.html). 