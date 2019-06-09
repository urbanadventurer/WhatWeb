##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "CHANCE-i-DiViS-DVR"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-03-14
  "Andrew Horton", # v0.2 # 2016-04-19 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "CHANCE-i DiViS digital video recorder device"
website "http://www.chance-i.com/dvr_system"

# ShodanHQ results as at 2011-03-14 #
# 13,735 for Techno Vision Security System

matches [
	{:search=>"headers[server]", :version=>/^Techno Vision Security System Ver. ([\d\.]+)$/ }
]

end

