##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Replaced passive function with match
##
Plugin.define "BadBlue" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-20
version "0.2"
description "A free, very small Windows web server for sharing, publishing and serving files."
website "http://www.badblue.com/"

# Google results as at 2011-04-20 #
# 12 for intitle:"BadBlue: the file-sharing web server anyone can use" -intitle

# ShodanHQ results as at 2011-04-20 #
# 18 for BadBlue

# Dorks #
dorks [
'intitle:"BadBlue: the file-sharing web server anyone can use" -intitle'
]

matches [
	{ :version=>/^BadBlue\/([\d\.]+)$/, :search=>"headers[server]" } 
]

end


