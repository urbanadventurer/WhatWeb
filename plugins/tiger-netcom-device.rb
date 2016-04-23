##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Tiger-Netcom-Device" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-27
version "0.2"
description "Tiger Netcom is a manufacturer and distributor of Voice over Internet Protocol (VoIP) equipment."
website "http://www.vanaccess.com/"

# ShodanHQ results as at 2011-03-13 #
# 21 for TigerNetCom -SIP
# 30 for TigerNetCom

matches [
	
	# HTTP Server Header
	{ :regexp=>/^TigerNetCom/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^TigerNetCom\/([^\s]+)$/, :search=>"headers[server]" },

]

end

