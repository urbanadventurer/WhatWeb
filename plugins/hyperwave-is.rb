##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-20 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Hyperwave-IS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-07
version "0.2"
description "Hyperwave Information Server"
website "http://www.hyperwave.com/"

# ShodanHQ results as at 2011-06-07 #
# 46 for hyperwave

matches [
	
	# Version Detection # HTTP Server Header
	{ :regexp=>/^Hyperwave-/, :search=>"headers[server]" },
	{ :version=>/^Hyperwave-IS\/([^\s]+)$/, :search=>"headers[server]" },
	{ :version=>/^Hyperwave-Information-Server\/([^\s]+)$/, :search=>"headers[server]" },
	
]

end

