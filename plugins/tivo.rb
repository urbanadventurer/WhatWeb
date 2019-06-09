##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "TiVo"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-05-21
  "Andrew Horton", # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "TiVo is a digital video recorder developed and marketed by TiVo, Inc."
website "http://www.tivo.com/"

# Google results as at 2011-05-21 #
# 1 for intitle:"TiVo DVR" "Congratulations" "You've successfully connected your TiVo"

# ShodanHQ results as at 2011-05-21 #
# 4,997 for tivo-httpd

# Dorks #
dorks [
'intitle:"TiVo DVR" "Congratulations" "You\'ve successfully connected your TiVo"'
]

matches [
	# HTTP Server Header
	{ :regexp=>/^tivo-httpd/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^tivo-httpd-[\d]+:(.+)$/, :search=>"headers[server]" },

]

end

