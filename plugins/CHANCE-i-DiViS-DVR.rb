##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CHANCE-i-DiViS-DVR" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "CHANCE-i DiViS digital video recorder device - Homepage: http://www.chance-i.com/dvr_system"

# ShodanHQ results as at 2011-03-14 #
# 13,735 for Techno Vision Security System



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Techno Vision Security System Ver. ([\d\.]+)$/) } if @headers["server"] =~ /^Techno Vision Security System Ver. ([\d\.]+)$/

	# Return passive matches
	m

end

end

