---
layout: post
title: "RubyMotion Day 3"
date: 2013-01-23 10:27
comments: true
categories: rubymotion
---

##UIViewControllers
>a view controller manages a set of views that makes up a portion of your app's user interface.

  - UIViewController:
    - sends data to NSArray
    - sends view to UIView
    - sends a target to UIButton
    - Receives a delegate from UITextField

###UITabBarController
  - common to use that as the main controller
  - this controls the display of the main screen

###UITabBarItem
  - displays the tab buttons in the along the top or bottom

##TableViews
  - Very flexible
  - Uses the delegate pattern
    - UITableViewController is a controller object that manages a table view. 
      - when the table view is about to appear the first time it's loaded, it reloads the table view's data
      - whent he table view has appeared, the controller flashes the tbale view's scroll indicators
  - inherits from the view controller adn dispays the table view cells

  - supports different kinds of layouts
    - plain 
    - grouped -> Like the ones you can find in the Settings app of an iPhone.

  - the UITableView has subviews that will contain the cells

  - Data sources
    - special type of delegate 
      used by the tableView in order to get info needed to display
        - # of rows, etc

  - like tabs this is set in the app delegate

  - when you have data that is more than will fit on the screen, you probably only need to create 9 or so cells and then you can send in the data to fit in those cells. Loading 50 cells will make the interface very slow.
    - We reuse the cells with *dequeue* like `tableView.dequeueReusableCellWithIdentifier(NEWS_CELL_REUSE_ID)`
    - Only if the table view can not find a cached cell with that identifier, we build it: `UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: NEWS_CELL_REUSE_ID)`

  - System Cell Types
    - four kinds provided by apple
    - can also create your own cells

  - *creating custom tableviews is a good example of using when to use Interface Builder.*

  - `viewWillAppear` method will be called every time the view is shown
  - `initWithStyle:` This is the initializer method used to create instances of UITableViewController

  - `p.list files` are Property list files -> files that store serialized objects
    - Objective-C supports these files natively

  - Animation for adding or deleting a cell with:
```ruby Animation for deleting and inserting
#to delete
  self.tableView.deleteRowsAtIndexPaths([selected_cell_index_path],
    withRowAnimation:UITableViewRowAnimationMiddle)
#to insert
  self.tableView.insertRowsAtIndexPaths([index_path],
    withRowAnimation:UITableViewRowAnimationRight)
```

###Custom Cells
  - Need UITableViewCell as the super class

##Navigation Controllers
  - very similar to TabBarControllers, but like a chain of views.
    - when you have a master, detail relationship you should use a Navigation controller
      - you get a back button for free!

  - can use CoreAnimation to create your own animation instead of using the standard transition.
  
  - A Navigation Bar can only have two buttons, one to the left and one to right. T
  - The buttons should be instances of UIBarButtonItem not of UIButton.

###Dirty Views
  - needed to update a view -> `@receiver.setNeedsDisplay`

##A ruby aside
```ruby 'not' examples
  ! me
  not me
  i != you

#in the wild
  def isFormValid
    not @email_textfield.text.empty? and not @password_textfield.text.empty?
  end
```