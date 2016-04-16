##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "Forest-Blog" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-12
version "0.2"
description "Forest Blog"
website "http://www.hostforest.co.uk/Products/blog.asp"

# Google results as at 2010-08-11 #
# 243 for "powered by Forest Blog"
# 15  for intitle:"Forest Blog Administration"


# Dorks #
dorks [
'"powered by Forest Blog"',
'intitle:"Forest Blog Administration"'
]



# Matches #
matches [

# Powered by text
{ :regexp=>/Powered [B|b]?y[:]? <a href="http:\/\/www.hostforest.co.uk\/[^"]*"[^>]+title="Forest Blog"[^>]*>/ },

# Admin Page # Default Title
{ :text=>'<title>Forest Blog Administration</title>' },

# Admin Page # Default h1 Heading
{ :text=>'			<h1>Forest Blog Administration</h1>' },

# Version Detection # Powered by text
{ :version=>/Powered [B|b]?y[:]? <a href="http:\/\/www.hostforest.co.uk\/[^"]*"[^>]+title="Forest Blog"[^>]*>Forest Blog<\/a> v([\d\.]+)/ },

]

end

