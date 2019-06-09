##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "IBM-Internet-Connection-Server"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-06-07
  "Andrew Horton", # v0.2 # 2016-04-20 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "IBM Internet Connection Server - Homepage [offline] : http://www.ics.raleigh.ibm.com"

# ShodanHQ results as at 2011-06-07 #
# 3 for ibm internet connection server -IBM_HTTP_Server

matches [

	{ :version=>/^IBM Internet Connection Server\/([^\s]+)$/, :search=>"headers[server]" },
	
]

end

