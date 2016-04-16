##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PmWiki" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-18
version "0.1"
description "PmWiki is a wiki-based system for collaborative creation and maintenance of websites."
website "http://www.pmwiki.org/"

# ShodanHQ results as at 2012-03-18 #
# 30 for imstime



# Matches #
matches [

# Set-Cookie # imstime
{ :search=>"headers[set-cookie]", :regexp=>/imstime=[\d]+;/ },

# HTML Comment
{ :text=>'<!--PageLeftFmt-->' },

# span class='commentout-pmwikiorg'
{ :text=>"<span class='commentout-pmwikiorg'>" },

# StyleSheet
{ :regexp=>/<link rel='stylesheet' href='[^']*\/pmwiki\/pub\/skins\/pmwiki\/pmwiki\.css' type='text\/css' \/>/ },

]

end

