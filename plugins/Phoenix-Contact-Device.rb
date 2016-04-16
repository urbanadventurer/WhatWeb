##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Phoenix-Contact-Device" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-02
version "0.1"
description "Phoenix Contact manufactures industrial automation, interconnection, and interface solutions. It offers terminal blocks, which include relays, signal conditioning, controller system cabling, surge suppression, transition interfaces, and custom interfaces; printed circuit board terminal blocks; controllers and IO; as well as industrial plug connectors."
website "http://www.phoenixcontact.com/"

# ShodanHQ results as at 2011-08-02 #
# 71 for Phoenix-Contact



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	if @headers["server"] =~ /^Phoenix-Contact\/([^\s]+) \(powered by SpiderControl TM\)$/
		m << { :version=>"#{$1}" }
	end

	# Return passive matches
	m
end
end

