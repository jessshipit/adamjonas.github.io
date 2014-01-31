---
layout: post
title: "node, express, backbone and marionette -- sorting out the pieces"
date: 2014-01-10 17:47
comments: true
categories: javascript
---

### Express with Node
  - Express is a framework that takes Node from a barebones application and turns it into something that behaves more like the web servers we're all used to working with.
  - Express feels like the [sinatra](http://www.sinatrarb.com/) of node.

### Bower vs. npm
  - It was advised that bower is the front end dependencies package manager, where the npm is for the backend. [see](https://www.google.com/search?q=npm+of+backend+and+bower+for+the+front+end&oq=npm+of+backend+and+bower+for+the+front+end&aqs=chrome..69i57.8637j0j9&sourceid=chrome&espv=210&es_sm=91&ie=UTF-8#es_sm=91&espv=210&q=npm+for+backend+and+bower+for+the+front+end)
  - You specify what dir your want to install the bower packages with a `.bowerrc` file which goes in the project root. Here are [some examples](https://gist.github.com/facultymatt/5482781) of these types of files.
    - [This tutorial](http://net.tutsplus.com/tutorials/javascript-ajax/a-requirejs-backbone-and-bower-starter-template/) was helpful to get up and running with require.js and bower

### Mean stack
  - [Mean.io](http://mean.io/)
  - Really like this [tutorial here](http://cwbuecheler.com/web/tutorials/2013/node-express-mongo/)

### Asynchronous Module Definition
  - The AMD format comes from wanting a module format that was better than today's "write a bunch of script tags with implicit dependencies that you have to manually order" and something that was easy to use directly in the browser. [further reading](http://requirejs.org/docs/whyamd.html)
  - The standard loader is [RequireJS](http://requirejs.org/), but in production you could use a replacement AMD loader called [Almond](https://github.com/jrburke/almond). It is a smaller "shim" loader, providing the minimal AMD API footprint that includes loader plugin support. Some developers like to use the AMD API to code modular JavaScript, but after doing an optimized build, they do not want to include a full AMD loader like RequireJS, since they do not need all that functionality. Some use cases, like mobile, are very sensitive to file sizes. By including almond in the built file, there is no need for RequireJS. almond is around 1 kilobyte when minified with Closure Compiler and gzipped.
