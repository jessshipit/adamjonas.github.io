---
layout: post
title: "Back to Gitbo"
date: 2012-12-28 21:37
comments: true
categories: 
---

###Deleting Remote Github Branches
  - There are some solutions [here](http://stackoverflow.com/questions/2003505/how-do-i-delete-a-git-branch-both-locally-and-in-github), but I wasn't overjoyed with them considering I have 70 some branches to prune. There are some other ideas [here](http://www.gitguys.com/topics/adding-and-removing-remote-branches/) and in the [GitBook](http://git-scm.com/book/ch3-5.html).

###Responsive Layout
  - we have been having issues with the homepage loading with two of the three buttons in one row and the third on the bottom. 
    - The lion share of the fix was changing the layout from grid to responsive and changing the span number from 3 to 4. 
      - A fuller explanation can be found [here](http://twitter.github.com/bootstrap/scaffolding.html)

###Server issues
  - I had some problems with deploying. After some frustration, I saw that the `application.yml` file was not being included. There was no sym link and there was no actual file in the shared folder on the server. I ssh'ed into the server, but didn't have much luck. At the end, I simply used an FTP uploader to create the `application.yml` file and cut and pasted the content. It worked, but I didn't feel great about the solution.

###Oauth Permissions
  - Previously we required users to give us read/write access to both there public and private repos. That isn't really necessary. Changing the scope permissions in outlined [here](http://developer.github.com/v3/oauth/#scopes).
    - I changed the permissions and saw that I need to restart the server for those changes to take effect locally. I assume the same is necessary on the server.