---
layout: post
title: "jquery-air-intermediate"
date: 2012-08-15 15:35
comments: true
categories: 
---



```javascript Retriving the href
$('#tabs ul li:last a').attr('href')
$('#tabs ul li:last a').data('flights') //this would be from an html5 data tag
```


event delegation-
it can be method chained and performs faster than live
$(document).delegate

***Don't forget the brackets on the selector!!***

###eq selector###

eq(element#) - a selector
```javascript
$('ol.econ­omy-class li.ro­w:eq(1) ol li:eq­(3)').html­()
```

```javascript
$('ol.econ­omy-class li.ro­w:eq(1) ol li:eq­(3) a').a­ttr('href'­);
// to access the href you need to specify the a tag
$('ol.econ­omy-class li.ro­w:eq(1) ol li:eq­(3) a').d­ata('seat'­);
```

```javascript
$('div.seating-chart a.available').click(function (event){
  event.preventDefault();
  $('a.available').removeClass("selected")
  $(this).addClass("selected")
});
```

###Bind Element###
jQuery bind() function is used to attach an event handler to elements, while the unbind() is used to detached an existing event handler from elements.

```javascript
$('div.seating-chart a.available').bind({
  click: selectSeat
});
```
This allows you to list multiple events for each element. NOTE the different syntax, this becomes like a MAP now (very similar to a hash)

###Unbind Element###
Let’s imagine the following scenario...
The user clicks on a “vote” button.
Some AJAX calls are performed.
After a successful AJAX call you setup a cookie to deny further votes from this machine.
So one possible solution is to unbind the click event...

Have something happen on a click event, but only once! Unbind the click handler after the element has been clicked once.
```javascript Once and only once...
$('#my-selector').bind('click', function() {
       $(this).unbind('click');
       alert('Clicked and unbound!');
});
```
```javascript Jquery Air
function selectSeat(e) {
  e.preventDefault();
  $('.selected').removeClass('selected');
  $(this).addClass('selected').unbind("click", selectSeat);
  $('#seatSelected').text($(this).data('seat'));
  $('#confirm-seat').show();
}

$('div.seating-chart li a.available').click(selectSeat);
```

###Live Event###
```javascript
$('a.confirm-upgrade').live("click", confirmUpgrade);
```
Bind binds to the event one time
Live will look for that event now or in the future and will catch it and call the right function

###Delegate###
```javascript Delegate > live
$('#flights a').live("click", selectFlight);
// is the same as
$(document).delegate("#flights a", "click", selectFlight);
// this is too general. It would be better if you just checked inside a specific element
$(#tabs div).delegate("#flights a", "click", selectFlight);
// check inside the element rather than the entire page
```
Delegate can be method chained and it is more performant

###Ajax###
Video2
$.get and $.ajax are alternatives. $.ajax is slightly more 
cache: false option ensures that your browser won't cache the html for every request
Error handling
Loading div - call beforeSend the AJAX invoked then hide it in the complete:
If it returns successfully - success: and if not - error: