##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "EulerianWS"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-01-08
  "Andrew Horton", # v0.2 # 2016-04-19 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "Eulerian Technologies Web Server (EulerianWS) [French]"
website "http://www.eulerian.com/fr/"

# About 127 ShodanHQ results for server EulerianWS @ 2011-01-08



# Matches #
matches [

	# Version Detection # Version footer HTML
	{ :version=>/<td align="right"><address>EulerianWS\/([\d\.]+)<\/address><\/td><\/tr>/ },
	# HTTP Server Header
	{ :version=>/^[\s]*EulerianWS\/([^\s^\r^\n]+)/, :search=>"headers[server]" },

]

end

