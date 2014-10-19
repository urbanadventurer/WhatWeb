##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Google-Results" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-25
version "0.1"
description "This plugin identifies Google search results pages and extracts the result URLs, query and number of results from the results."
website "http://www.google.com/"

# Matches #
matches [

	# Detect Google search query
	{ :module=>/<title>([^<]{1,256}) \- Google Search<\/title>/ },

	# Extract number of results
	{ :module=>/Advanced search<\/a><\/div><div><div id=resultStats>([^<]{1,40}) results<nobr>/ },

]

# Passive #
def passive
	m=[]

	# Extract Google results
	m << { :string=>@body.scan(/<li class=g><h3 class="r"><a href="([^\"^>]*)" class=l>/) } if @body =~ /<li class=g><h3 class="r"><a href="[^\"^>]*" class=l>/

	# Return passive matches
	m

end

end


