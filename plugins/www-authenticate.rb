##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# modified by Andrew Horton
Plugin.define "WWW-Authenticate" do
author "Aung Khant, http://yehg.net"
version "0.1"
description "Get WWW-Authenticate header. Print its values - type and realm"

def passive
	m=[]

	unless @meta['www-authenticate'].nil?
		header = @meta['www-authenticate'].scan(/(.*?) realm="(.*?)"/)
		unless header.nil?
		   type = header[0][0]
		   realm = header[0][1]
		   m << {:string=>"#{type}, #{realm}" }
		end
	end
	m
end

end


