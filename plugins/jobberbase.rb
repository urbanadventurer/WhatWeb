##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Update regex and ghdb matches
##
Plugin.define "jobberBase" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-06
version "0.2"
description "jobberBase is the open-source job board software that helps you set up a jobsite in minutes!"
website "http://www.jobberbase.com/"

# About 116,000 results for +Companies +Sitemap "Proudly powered by jobberBase" @ 2010-60-06

# Dorks #
dorks [
'"Companies" "Sitemap" "Proudly powered by jobberBase"'
]



matches [

# GHDB Match
{ :ghdb=>'Companies Sitemap "Proudly powered by jobberBase"', :certainty=>75 },

# Meta author
{ :text=>'<meta name="author" content="http://www.jobberbase.com" />' },

# Powered by text
{ :regexp=>/Proudly powered by[\s]+<a href="http:\/\/www.jobberbase.com\/"[^>]*title="open source job board software">jobberBase<\/a>/ },

]

end

