##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "glFusion" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "Powerful content management with synergy, stability, & style. A dynamic system based on flexible and granular permissions, with spam protection, forums, file management, media gallery, calendars, polls, site-wide search, RSS feeds, and more!"
website "http://www.glfusion.org/"

# Google results as at 2011-03-15 #
# 376 for "Page created in" "seconds by glFusion" +RSS



# Matches #
matches [

# div # gl_moomenu1
{ :certainty=>75, :regexp=>/<div (class|id)="gl_moomenu1">/ },

# ul # gl_moomenu1
{ :certainty=>75, :text=>'<ul class="gl_moomenu1">' },

# Page created in link
{ :regexp=>/Page created in [\d\.]+ seconds( |&nbsp;)by <a href="http:\/\/www.glfusion.org\/"[^>]*>glFusion<\/a>/ },

]

end


