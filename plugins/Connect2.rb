##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Replaced passive function with matches
##
Plugin.define "Connect2" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "Message Handling System (MHS) is an important early email protocol developed by Novell. A compatible family of products from Infinite Technologies ( now Captaris - http://www.captaris.com ) and marketed under the name Connect2 were also very widely used as part of MHS-based email networks. - More info: http://en.wikipedia.org/wiki/Message_Handling_System"

# ShodanHQ results as at 2011-05-31 #
# 25 for Web Services Module

matches [
	# HTTP Server Header
	{ :regexp=>/for Connect2-SMTP/, :search=>"headers[server]" },

	# HTTP Server Header # Module Detection
	{ :module=>/^(Web Services Module [^\s]+ \([\d]+\)) for Connect2-SMTP$/, :search=>"headers[server]" },

]

end

