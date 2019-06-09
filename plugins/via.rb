##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Via-Proxy"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-14
  # v0.2 # 2011-02-16 # Removed redundant @headers["Via"] match. 
  "Andrew Horton", #2017-12-01 # Replaced passive function with match
]
version "0.3"
description "This plugin extracts the proxy server details from the Via param of the HTTP header."

# ShodanHQ results as at 2010-10-14 #
# 131,646 for "Via: "

matches [
	{ :search => "headers[via]", :string => /^.*$/ }
]

end

