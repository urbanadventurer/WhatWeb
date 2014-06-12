##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ben-SSL" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-08
version "0.1"
description "Apache-SSL was developed by Ben Laurie and is often referred to as Ben-SSL - Homepage: http://apache-ssl.org/"

# ShodanHQ results as at 2011-02-08 #
# 34777 for Ben-SSL



# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :version=>@headers["server"].to_s.scan(/Ben-SSL\/([\d\.]+)/i).flatten } if @headers["server"].to_s =~ /Ben-SSL\/([\d\.]+)/i

	m

end

end

