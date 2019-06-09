##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "SVN"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-30
  "Andrew Horton", # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "SVN HTTP header."

# About 85500 ShodanHQ results for "server: SVN" @ 2010-10-30

matches [

	# HTTP Header 
	{ :regexp=>/[^\r^\n]*SVN/, :search=>"headers[server]" },

	# HTTP Header # Version detect
	{ :version=>/[^\r^\n]*SVN\/([^\r^\n^\s]*)/, :search=>"headers[server]" },

]

end

