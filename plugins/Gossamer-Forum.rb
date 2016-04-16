##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Gossamer-Forum" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-19
version "0.1"
description "Gossamer Forum is the ideal software solution to create, or enhance, any online community. Great features including a WYSIWYG Editor and powerful search makes Gossamer Forum one of the most fully featured forum scripts out there."
website "http://www.gossamer-threads.com/products/gossamer-forum/"

# Google results as at 2011-03-19 #
# 74 for "Powered by Gossamer Forum" filetype:cgi inurl:gforum.cgi

# Dorks #
dorks [
'"Powered by Gossamer Forum" filetype:cgi inurl:gforum.cgi'
]



# Matches #
matches [

# GHDB
{ :ghdb=>"Powered by Gossamer Forum filetype:cgi inurl:gforum.cgi" },

# Error Page
{ :certainty=>75, :text=>'<title>Gossamer Forum: An error occured!</title>' },

# Version Detection # Powered by link
{ :version=>/Powered by <a href="http:\/\/www.gossamer-threads.com">Gossamer Forum v.([\d\.]+)<\/a>/ },

# Username Detection # username Parameter
{ :account=>/<a href="gforum\.cgi\?username=([^;^>^"]+);guest=[\d]+">/ },

]

end


