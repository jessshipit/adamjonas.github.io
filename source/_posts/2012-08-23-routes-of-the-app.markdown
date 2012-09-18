---
layout: post
title: "routes of the app"
date: 2012-08-23 12:35
comments: true
categories: 
---

###The plan for the refactor###

1. Multiple errors are being mass assigned a unique tag
2. multiple tags are being assigned to an error

3. individual tags are assigned to an individual error
4. individual tags are being removed from an error

Invidual Tag and Error
	DELETE /errors/id/tags/id - Remove this tag from that error
	POST /errors/id/tags/id - Adding this tag to that error

Multiple Tags to an Error
	PUT /errors/id/tags -
	
Update an Error
	# Sure, it could also accept tags tag_tokens=
	PUT /errors/id

Multiple Errors are Assigned One Tag
	POST /tags/id/errors
	{
		error_ids => [],
	}

	Supply a Tag ID in the URL along with an array of error_ids.

	DELETE /tags/id/errors


###Creating the controllers###
tags_controller is responsible for updating tags_controller
the errors controller is responsible for updating errors
-the errors/tags controller is responsible for update tags on an error