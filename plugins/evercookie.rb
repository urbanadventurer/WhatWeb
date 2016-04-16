##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-23 # Brendan Coles <bcoles@gmail.com>
# Updated regex
# Added version detection and script src path extraction
##
Plugin.define "evercookie" do
author "Aung Khant <http://yehg.net/>" # 2011-02-04
version "0.2"
description "EverCookie - evercookie is a javascript API available that produces extremely persistent cookies in a browser. Its goal is to identify a client even after they've removed standard cookies, Flash cookies (Local Shared Objects or LSOs), and others."
website "http://samy.pl/evercookie/"



# Matches #
matches [

# GHDB # Filename, extension and text
{ :ghdb=>'inurl:/evercookie.js filetype:js "\*  by samy kamkar : code@samy.pl : http://samy.pl"' },

# Version Detection
{ :version=>/^ \* evercookie ([\d\.]{1,3}) \([\d]{2}\/[\d\.]{2}\/[\d\.]{4}\) -- extremely persistent cookies/ },

# Aggressive # Check for evercookie.js in current directory
{ :url=>'evercookie.js',:text=>'*  by samy kamkar : code@samy.pl : http://samy.pl'},

# Detect <script> src
{ :string=>/<script[^>]+src=['"]([^"^'^>]*evercookie\.js)['"][^>]*>[\s]*<\/script>/ },

]


end


