##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

##
Plugin.define "Content-Language" do
author "Peter van der Laan"
version "0.1"
description "Detect the content-language setting from the HTTP header."

# Passive #
def passive
	m=[]

	# HTTP Server Header # Content-Language
	unless @headers["content-language"].nil? or @headers["content-language"].empty?

		# Language Detection
		m << { :string=>@headers["content-language"].to_s }
	end
	
	# Return passive match
	m
end

end

