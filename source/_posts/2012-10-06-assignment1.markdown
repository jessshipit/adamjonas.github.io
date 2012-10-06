---
layout: post
title: "Assignment1"
date: 2012-10-06 14:54
comments: true
categories: ruby code
---

```ruby Quiz1.rb
# Write a program that tells you the following:
#
# Hours in a year. How many hours are in a year? - 6pts
# Minutes in a decade. How many minutes are in a decade? - 6pts
# Your age in seconds. How many seconds old are you? - 6pts
#
# Define at least the following methods to accomplish these tasks:
#
# seconds_in_minutes(1) #=> 60 - 3pts
# minutes_in_hours(1) #=> 60 - 3pts
# hours_in_days(1) #=> 24 - 3pts
# days_in_weeks(1) #=> 7 - 3pts
# weeks_in_years(1) #=> 52 - 3pts
#
# If I am 1,111 million seconds old, how old am I?
#   Define an age_from_seconds method - 7pts

def seconds_in_minutes(minutes)
	minutes*60
end

def minutes_in_hours(hours)
	hours*60
end

def hours_in_days(day)
	day*24
end

def days_in_weeks(weeks)
	weeks*7
end

def weeks_in_years(years)
	years*52
end

def hours_in_years(years)
	years*weeks_in_years(1)*days_in_weeks(1)*hours_in_days(1)
end

def minutes_in_a_decade(decades)
	decades*hours_in_years(10)*minutes_in_hours(1)
end

def age_in_seconds(years)
	hours_in_years(years)*minutes_in_hours(1)*seconds_in_minutes(1)
end

def age_from_seconds(seconds)
	minutes = seconds/60 
	hours = minutes/60
	days = hours/24
	years = days/365
	years.to_f
end

puts "There are #{seconds_in_minutes(1)} seconds in minutes"
puts "There are #{minutes_in_hours(1)} minutes in hours"
puts "There are #{hours_in_days(1)} hours in a day"
puts "There are #{days_in_weeks(1)} days in a week"
puts "There are #{weeks_in_years(1)} weeks in a year"
puts "There are #{hours_in_years(1)} hours in a year"
puts "There are #{minutes_in_a_decade(1)} minutes in a decade"
puts "You are #{age_in_seconds(31)} seconds old"
puts "You are #{age_from_seconds(1111000000)} years old"
```