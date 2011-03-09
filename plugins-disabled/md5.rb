##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2
# remove :certainty
##
Plugin.define "MD5" do
author "Andrew Horton"
version "0.2"
description "MD5 sum of html body. Useful to find matching pages"

# Passive #
def passive
	m=[]

	# MD5 hash of HTML source # :string=>Digest::MD5.hexdigest(@body)	
	unless @md5sum.nil?
		m << {:name=>"md5 hash of html",:string=>@md5sum}
	end

	# Return passive matches
 	m
end

end

