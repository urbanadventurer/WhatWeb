##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # Brendan Coles <bcoles@gmail.com>
# Fixed regex
##
Plugin.define "RSS-Feed" do
author "Caleb Anderson"
version "0.2"
description "This plugin detects RSS feeds and extracts the RSS feed source."

# Examples #
examples %w|
itsecuritysolutions.org
morningstarsecurity.com
ha.ckers.org
www.kiwicon.org
adrianlamologs.blogspot.com
www.wired.com
|

# Matches #
matches [

# Extract RSS feed source
{ :version=>/<link[^>]*href[\s]*=[\s]*["']([^'^"^\s^>]+)[^>]*type[\s]*=[\s]*["']application\/rss\+xml["'][^>]*/i },
{ :version=>/<link[^>]*type[\s]*=[\s]*["']application\/rss\+xml["'][^>]*href[\s]*=[\s]*["']([^'^"^\s^>]+)[^>]*/i },

]

end

