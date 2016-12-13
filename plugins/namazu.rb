##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Namazu" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-30
version "0.1"
description "Namazu is a full-text search engine intended for easy use. Not only does it work as a small or medium scale Web search engine, but also as a personal search system for email or other files."
website "http://www.namazu.org/"

# Google results as at 2011-03-30 #
# 259 for "powered by Namazu"

# Dorks #
dorks [
'"powered by Namazu"'
]



# Matches #
matches [

# Powered by footer
{ :regexp=>/This search system is powered by[\s]+<strong><a href="http:\/\/www\.namazu\.org\/">Namazu<\/a><\/strong>/ },
{ :regexp=>/Powered by <a href="http:\/\/www\.namazu\.(org|cc)\/[^"]*" target="_blank">(N|n)amazu<\/a>/ },

# HTML Comment and strong tags
{ :regexp=>/<p><strong> Total <!-- HIT -->[\d]+<!-- HIT --> documents matching your query.<\/strong><\/p>/ },

# Version Detection # HTML Comment
{ :version=>/<strong><a href="http:\/\/www\.namazu\.org\/">Namazu<\/a> <!-- VERSION --> v([\d\.]+) <!-- VERSION --><\/strong>/i },
{ :version=>/This search system is powered by <a href="http:\/\/www\.namazu\.org\/">Namazu<\/a> <!-- VERSION --> v([\d\.]+) <!-- VERSION --><\/p>/i },

]

end


