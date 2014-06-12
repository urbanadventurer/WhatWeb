##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-04-02 #
# Updated regex
##
# Version 0.2
# removed :certainty=>100
##
Plugin.define "X-Powered-By" do
author "Andrew Horton"
version "0.3"
description "X-Powered-By HTTP header"

# ShodanHQ results as at 2011-04-02 #
# 7,122,968 for x-powered-by



# Passive #
def passive
	m=[]

	# X-Powered-By Headers
	unless @headers["x-powered-by"].nil?
		m << { :name=>"x-powered-by string", :string=>@headers["x-powered-by"] }
	end

	# Return passive matches
	m
end

end


