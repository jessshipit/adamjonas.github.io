---
layout: post
title: "jquery-air-beginner"
date: 2012-08-15 15:34
comments: true
categories: 
---


The DOM is a node structure or tree
has HTML tag, head tag, title child, body tag, etc.
```javascript
$("h1");
//find all h1s
$("p");
//find all ps
$("p#final");
//find the paragraph with ID final

//these return arrays with the elements inside
//if the search doesn't return anything, then it returns an empty array []
// be careful- this empty array is considered truthy
```

```javascript
$("h1, p.plan")
//returns an array with both elements-- one string, seperated by commas
$("h1", "p.plan") // THIS WON'T WORK
```

```javascript
$('p:first');
//returns the first p it encounters
$('p.first')
//looks for the p.first node
```

To select children elements use a space between the parent and child selector...
For example, to select all the A tags that are children of a tag with id = foo, you'd do this:
```javascript
$('#foo a');
//in the exercise
$('ul#first_class li');
//Select all the rows and seats in first class, everything with an <LI>
```

- You can go as many levels deep as you want when selecting children
- For example, to select all A tags that have two <div> parents, you'd do this:
```javascript
$('div div a');
//in the exercise:
$('ul li ul li');
```

```javascript Find all the window seats (a & d in first class, and a & f in economy)
$('li.a, ul#first_class li.d, ul#economy_class li.f');
```

can pass in a map which is like a hash in ruby
key are seperated from values by colons

```javascript
var belts = confirm('Turn on the fasten seatbelt sign?');

alert('Seatbelts: ' + belts);
//can string multiple calls together like above
```
having trouble with the syntax of closing the parentheses. 

###Why JS?###
HTML is for structure
CSS is for presentation
Javascript is for interaction -- it shouldn't take over the duties of the other two
	use .css() with reservation. better to manipulate the class and IDs 

.addClass()
.removeClass() //if you do this with no parameters it will strip it of all css classes

hasClass() #=> true /false

do/undo toggle pattern
('p:first').toggleClass("bigger"):

.show()
.hide()
.toggle()

Document ready waits for the DOM to download then the DOM comes through. When it's finished the ready event fires

***JSON*** is just a javascript map that gets passed around

DOM and CSS communicate through classes and IDs
use .css() with reservation. better to manipulate the class and IDs thereby delegating the responsbility to the css

###Common queries###
.text() => query text
.html() => queries html
.prepend() => inserts inside the taget object before
.append() => inserts inside the target object after
.before() => add element before selection
.after() => add element after selection
.remove => pulls the target from the DOM
to move an object remove it while storing it in a var and the insert it where you'd like (remember vars don't require ' 's )

###event bubbling###
JS is triggered by the environment or the user
if someone clicks on a span, the JS engine asks if anyone is listening for that click, or a click on the paragraph or the whole body-- ***it walked up the DOM tree looking for event handlers***

###Functions###
function optionalname (parameters) {instructions}
```javascript For Instance
function popWarning (message) {
	alert("Warning: " + message);	
}
```
Anonymous Function
:  Just a function that isn't given a name
so just function (parameters) {instructions}

```javascript Anon e.g. of previous function
function (message) {
	alert("Warning: " + message);	
}
```
Since it has no name this can't be called by another function. Instead it is passed in to another function.
```javascript Doc Ready
$(document).ready(function(){
	alert("The DOM is ready!");
});
```
```javascript
$(document).ready(function(){
	$('p').click(function(){
	alert("Got it");
	});
});
```
###This: using this in javascript###
This refers to the current object (usually just a plain DOM element)
Since it's not a jquery element, we need to wrap it in $(this)
```javascript Using this
$(document).ready(function(){
	$('p').click(function(){
	$(this).hide();
	});
});
```
###Document ready and Timing###
If wrapped in a $(document).ready() the JS won't start looking though the document until every thing has been downloaded.


```javascript Named Functions
function increment_weight(){
  var display = $('div#gross_weight span#display');
  var weight = parseInt(display.text()); //notice parseInt doesn't need a $
  weight = weight + 50 ;
  display.text(weight);
}
```

```javascript
$(document).ready(function (){
  $('a#weight_down').click(function(event){
  // this code is run when a#weight_down is clicked
  var current_weight = $('span#display').text();
  //make sure you pull out the number, see the parseInt below
  var current_lbs = parseInt(current_weight);
  $("#display").text(current_lbs - 50);
  event.preventDefault(); // this prevents it from following the link
  });
});
```

###Hover###

```javascript
$(document).ready(function (){
  $('div#plane_features li').hover( 
  //the hover accepts two functions- the on-hover and off-hover
  function (){$(this).addClass('feature_hover');}, 
  //note the ',' at the end of the line
  function (){$(this).removeClass('feature_hover')}
  )
});
```
This can be refactored as....
```javascript Refactor
$(document).ready(function(){
  $('div#plane_features li a').hover(
    function(){ $(this).toggleClass("feature_hover");}
  );
});
```

###toggleClass###
Needs to be called on *this*

This is what I had...
```javascript
$(document).ready(function(){
  $('#plane_features li a').click(function(event){
      event.preventDefault();
      $('li').toggleClass("feature_selected");
      //this is wrong... it needs to be THIS
      }; // missed a closing parens here too
});
```
```javascript The Answer
$(document).ready(function(){
  $('#plane_features li a').click(function(event){
      
      $(this).toggleClass("feature_selected");
      event.preventDefault();
      });
});
```

###KeyPress###
Put the focus on the entire body, because you aren't sure what the focus will be when the key is pressed.

By defining the object with event e.g.
```javascript
function(event)
```
we get access to the *Event Object* which helps us with such things as:
- event.which - has a numeric code for the key which is pressed
- event has other attributes like pageX, pageY and target.

###If statement###
```javascript IF
function(event){
if (condition){instructions};
} //why no ; here?
```
so....
```javascript
function(event){
	if(event.which == 102){alert("fantastic")};
} //why no ; here?
```

```javascript
$(document).ready(function (){
  $('body').keydown(function (event){
      if(event.which == 83){$('li:first').toggleClass("feature_selected");
      } //still not ; here
    });
});
```

###event.stopPropogation###
call .stopPropogation in the handler to prevent the event from bubbling up the DOM tree


###Animation###
```javascript
$('div#altitude').hide("slow")
// takes "slow", "fast", and number in milliseconds as a parameter
```
This works with hide, the show and toggle functions
.slideUp("slow")
.slideDown()
.slideToggle()
.fadeOut()
.fadeIn()
.fadeToggle()

###True Ajax###
Sending and receiving information from the server via XMLHttpRequests
- best way to do that is with the .load() function 
```javascript
$('span.number').load(/flights/824/gate);
```
This load request will retrieve that address from the server and then inject it into the selected element an it and then the DOM will show that update


Attach a click event listener to the Refresh button that uses ajax to load '/nearby_flights' and places the response into the Nearby Flights list. Don't forget to prevent the default link behavior.
```javascript
$(document).ready(function(){
  $("a#refresh").click(function(event){
    $("ul#nearby_flights").load('/nearby_flights')
    event.preventDefault();
  });
});
```