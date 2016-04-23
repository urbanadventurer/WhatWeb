##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "CHANCE-i-DiViS-DVR" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.2"
description "CHANCE-i DiViS digital video recorder device"
website "http://www.chance-i.com/dvr_system"

# ShodanHQ results as at 2011-03-14 #
# 13,735 for Techno Vision Security System

matches [
	{:search=>"headers[server]", :version=>/^Techno Vision Security System Ver. ([\d\.]+)$/ }
]

end

