---
layout: post
title: "Gem Hunting"
date: 2012-11-24 20:47
comments: true
categories: 
---

- [All gems on Github](http://gems.github.com/list.html)

gems.each do |gem|
  curl "https://rubygems.org/api/v1/gems/#{gem}.json"
  nickname = output[:homepage_url].split('/')[-2]
end


curl https://rubygems.org/api/v1/gems/capybara.json


{"name":"capybara","downloads":2336729,"version":"2.0.1","version_downloads":5523,"platform":"ruby","authors":"Jonas Nicklas","info":"Capybara is an integration testing tool for rack based web applications. It simulates how a user would interact with a website","project_uri":"http://rubygems.org/gems/capybara",

"gem_uri":"http://rubygems.org/gems/capybara-2.0.1.gem",

"homepage_uri":"http://github.com/jnicklas/capybara",

"wiki_uri":null,"documentation_uri":null,"mailing_list_uri":null,"source_code_uri":null,"bug_tracker_uri":null,"dependencies":{"development":[{"name":"cucumber","requirements":">= 0.10.5"},{"name":"fuubar","requirements":">= 0.0.1"},{"name":"launchy","requirements":">= 2.0.4"},{"name":"rake","requirements":">= 0"},{"name":"rspec","requirements":">= 2.2.0"},{"name":"sinatra","requirements":">= 0.9.4"},{"name":"yard","requirements":">= 0.5.8"}],"runtime":[{"name":"mime-types","requirements":">= 1.16"},{"name":"nokogiri","requirements":">= 1.3.3"},{"name":"rack","requirements":">= 1.0.0"},{"name":"rack-test","requirements":">= 0.5.4"},{"name":"selenium-webdriver","requirements":"~> 2.0"},{"name":"xpath","requirements":"~> 1.0.0"}]}}