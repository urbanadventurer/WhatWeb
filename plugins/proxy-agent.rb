##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Proxy-Agent" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-30
version "0.1"
description "This plugin retrieves the proxy agent from the HTTP header."

# About 1444 ShodanHQ results for "proxy-agent:" @ 2010-10-30


# HTTP Header
def passive
	m=[]

	m << { :string=>@headers["proxy-agent"].to_s } unless @headers["proxy-agent"].nil?

	m

end

end

