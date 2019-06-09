##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "BXR"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-08-06
  # v0.2 # 2011-01-08 # Updated version detection. 
]
version "0.2"
description "BXR is an interface to manage a Blosxom-Based blog through the web or XML-RPC. Current it supports blogger, and metaWeblog APIs."
website "http://sourceforge.net/projects/bxr/"

# 1 result for "BXR Web Login" intitle:"Please Enter Password" @ 2010-08-06

# Dorks #
dorks [
'"BXR Web Login" intitle:"Please Enter Password"'
]



# Matches
matches [

	# Meta Generator
	{ :text=>'<meta name="generator" content="BXR::Web" />' },

	# Version Detection # Powered by text
	{ :version=>/<div class="bxrlogo">Powered by <a href="http:\/\/sourceforge.net\/projects\/bxr\/">BXR<\/a> ([\d\.]+)<\/div>/ },

]

end

