##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "RSS-Feed"
authors [
  "Caleb Anderson",
  "Brendan Coles <bcoles@gmail.com>", # Version 0.2 # Fixed regex
]
version "0.2"
description "This plugin detects RSS feeds and extracts the RSS feed source."



# Matches #
matches [

# Extract RSS feed source
{ :string=>/<link[^>]*href[\s]*=[\s]*["']([^'^"^\s^>]+)[^>]*type[\s]*=[\s]*["']application\/rss\+xml["']/i },
{ :string=>/<link[^>]*type[\s]*=[\s]*["']application\/rss\+xml["'][^>]*href[\s]*=[\s]*["']([^'^"^\s^>]+)/i },

]

end

