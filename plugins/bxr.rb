##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-08 #
# Updated version detection
##
Plugin.define "BXR" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-06
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

