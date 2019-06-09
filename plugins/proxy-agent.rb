##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Proxy-Agent"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-30
]
version "0.1"
description "This plugin retrieves the proxy agent from the HTTP header."

# About 1444 ShodanHQ results for "proxy-agent:" @ 2010-10-30


# HTTP Header
passive do
	m=[]

	m << { :string=>@headers["proxy-agent"].to_s } unless @headers["proxy-agent"].nil?

	m

end

end

