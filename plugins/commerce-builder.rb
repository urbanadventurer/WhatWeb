##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Commerce-Builder"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-06-01
  "Andrew Horton", # v0.2 # 2016-04-19 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "Internet Factory's Commerce Builder web server [Discontinued]"
website "http://www.ifact.com/"

# ShodanHQ results as at 2011-06-01 #
# 32 for commerce-builder

matches [

	{:version=>/^Commerce-Builder\/([^\s]+)/, :search=>"headers[server]"},

]

end

