##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "HTTP-Headers" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-23
version "0.1"
description "This plugin extracts the HTTP headers for plugin development purposes. - More info: http://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol"



# Passive #
def passive
	m=[]

	# Extract Headers
	unless @headers.nil?
		@headers.each do|h,v|
			m << { :string=>h.to_s+': '+v.to_s }
		end
	end

	# Return passive matches
	m
end

end

