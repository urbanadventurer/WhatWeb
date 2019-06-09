##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Grandstream-Phone"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-03-14
  "Andrew Horton", # v0.2 # added matches[] for devices without a Server: header, removed out of date examples
  # v0.3 # 2016-04-20 # Andrew Horton # Moved patterns from passive function to matches[]. 
]
version "0.3"
description "Grandstream Networks is the leading manufacturer of IP voice/video telephony and video surveillance solutions."
website "http://www.grandstream.com/"

# ShodanHQ results as at 2011-03-14 #
# 25,344 for Grandstream


matches [

	{:text=>'<title>Grandstream Device Configuration</title>'},
	{:text=>'All Rights Reserved Grandstream Networks, Inc.', :url=>"/"},

	# HTTP Server Header
	{ :regexp=>/^Grandstream/, :search=>"headers[server]" },

	# Model Detection
	{ :model=>/^Grandstream ([^\s]+) [\d\.]+$/, :search=>"headers[server]" },

	# Version Detection
	{ :version=>/^Grandstream [^\s]+ ([\d\.]+)$/, :search=>"headers[server]" },
	{ :version=>/^Grandstream\/([\d\.]+)$/, :search=>"headers[server]" },

]

end

