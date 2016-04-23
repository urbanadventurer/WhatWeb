##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-20 # Andrew Horton
# Moved patterns from passive function to matches[]
##

Plugin.define "IBM-Internet-Connection-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-07
version "0.2"
description "IBM Internet Connection Server - Homepage [offline] : http://www.ics.raleigh.ibm.com"

# ShodanHQ results as at 2011-06-07 #
# 3 for ibm internet connection server -IBM_HTTP_Server

matches [

	{ :version=>/^IBM Internet Connection Server\/([^\s]+)$/, :search=>"headers[server]" },
	
]

end

