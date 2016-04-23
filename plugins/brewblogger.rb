##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BrewBlogger" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-23
version "0.1"
description "BrewBlogger is a easy to set up, easy to use, browser-based homebrew logging and calculation suite. It is a PHP/MySQL-based system that provides today's brewer not only a fast and easy way to record their brewing activities, recipes, and awards, but also forum to share their zymurgistic efforts and expertise with the homebrewing community around the world."
website "http://www.brewblogger.net/"

# 115 for ("BrewBlogger 2.3.2 Club Edition developed by zkdigital.com"|"BrewBlogger 2.3.2 Personal Edition developed by zkdigital.com")
#  50 for "BrewBlogger 2.3.2 Personal Edition developed by zkdigital.com"
#  73 for "BrewBlogger 2.3.2 Club Edition developed by zkdigital.com"

# Dorks #
dorks [
'("BrewBlogger 2.3.2 Club Edition developed by zkdigital.com"|"BrewBlogger 2.3.2 Personal Edition developed by zkdigital.com")'
]



# Matches #
matches [

# Version Detection # div id="footer"
{ :version=>/<div id="footer">Content &copy; 2011 [^\n]+ &mdash; BrewBlogger ([^\s]+) (Personal Edition|Club Edition) developed by <a href="http:\/\/www\.zkdigital\.com" target="_blank">zkdigital\.com<\/a>/ },

# Edition Detection # div id="footer"
{ :string=>/<div id="footer">Content &copy; 2011 [^\n]+ &mdash; BrewBlogger ([^\s]+) (Personal Edition|Club Edition) developed by <a href="http:\/\/www\.zkdigital\.com" target="_blank">zkdigital\.com<\/a>/, :offset=>1 },

]

end

