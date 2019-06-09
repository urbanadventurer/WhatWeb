##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Django"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2012-02-27
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # v0.2 # 2016-08-19 # Added and updated cookies. 
  "zr000", # v0.3 # 2018-10-10 # Added another [\s]+ to <code>DEBUG = True<\/code> in[\s]+your
]

version "0.3"
description "Django is a high-level Python Web framework that encourages rapid development and clean, pragmatic design."
website "https://www.djangoproject.com/"

# ShodanHQ results as at 2012-02-27 #
# 878 for WSGIServer Python


# Matches #
matches [

# HTTP Server
{ :certainty=>25, :search=>"headers[server]", :regexp=>/^WSGIServer\/[^\s]+ Python\/[^\s]+$/ },

# Debug message # source: django/views/debug.py
{ :regexp=>/<div id="explanation">[\s]+<p>[\s]+You're seeing this error because you have <code>DEBUG = True<\/code> in[\s]+your[\s]+Django settings file/ },

# 404 Page # Debug message # source: django/views/debug.py
{ :url=>"/doesnotexist123highwaytothedangerzone", :string=>/<p>[\s]+Using the URLconf defined in <code>([^\.^\s]+)\.urls<\/code>,[\s]+Django tried these URL patterns, in this order:/ },

# Default Welcome Message # source: django/views/debug.py
{ :regexp=>'<meta name="robots" content="NONE,NOARCHIVE"><title>Welcome to Django</title>' },

# Default Welcome Message # Project Name # source: django/views/debug.py
{ :string=>/<li>Start your first app by running <code>python ([^\/]+)\/manage\.py startapp \[appname\]<\/code>\.<\/li>/ },

# /admin # Login Page
{ :regexp=>/<form action="\/admin\/[^"^>]*" method="post" id="login-form"><div style='display:none;'><input type='hidden' id='csrfmiddlewaretoken' name='csrfmiddlewaretoken' value='[a-f\d]{32}' \/><\/div>/ },

# Login Page
{ :certainty=>75, :text=>'<input type="hidden" name="this_is_the_login_form" value="1" />' },

# Cookie 
{ :search => "headers[set-cookie]", :regexp => /csrftoken/i, :name=>"csrftoken cookie" },
{ :search => "headers[set-cookie]", :regexp => /django_/, :name=>"django_ cookie" },

]


end

