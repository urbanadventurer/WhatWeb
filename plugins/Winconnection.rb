##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Winconnection" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.2"
description "The Winconnection 6 is a gateway to access the Internet developed within the UTM (Unified Threat Management) philosophy."
website "http://www.winco.com.br/"

# ShodanHQ results as at 2011-03-14 #
# 136 for Winconnection
# All results are from Brazil

matches [

	# HTTP Server Header
	{ :regexp=>/^Winconnection /, :search=>"headers[server]" },

	# HTTP Server Header # Version Detection
	{ :version=>/^Winconnection V([^\s]+) \(server ([A-Z\d]{6})\)$/, :offset=>0 , :search=>"headers[server]" },

	{ :string=>/^Winconnection V([^\s]+) \(server ([A-Z\d]{6})\)$/, :offset=>1 , :search=>"headers[server]" },

]

end

