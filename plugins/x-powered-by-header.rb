##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "X-Powered-By"
authors [
  "Andrew Horton",
  # v0.2 # removed :certainty=>100. 
  # v0.3 # 2011-04-02 # Updated regex. 
]
version "0.3"
description "X-Powered-By HTTP header"

# ShodanHQ results as at 2011-04-02 #
# 7,122,968 for x-powered-by



# Passive #
passive do
	m=[]

	# X-Powered-By Headers
	unless @headers["x-powered-by"].nil?
		m << { :name=>"x-powered-by string", :string=>@headers["x-powered-by"] }
	end

	# Return passive matches
	m
end

end


