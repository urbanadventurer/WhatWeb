##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "RedirectLocation"
authors [
  "Andrew Horton",
  # v0.2 # removed :certainty=>100
]
version "0.2"
description "HTTP Server string location. used with http-status 301 and 302"

passive do
	m=[]
	
	unless @headers.nil?
		location=nil	
		location=@headers["location"] if @headers.keys.include?("location")
	
		unless location.nil?
			m << {:name=>"location",:string=>location}
		end
	end
	
	m
end

end


