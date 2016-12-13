##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Warning" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-07
version "0.1"
description "The warning header contains additional information about the status of a response that might not be reflected by the response status code. According to RFC2616 section 14.46, if a cache returns a stale response, either because of a max-stale directive on a request, or because the cache is configured to override the expiration time of a response, the cache MUST attach a Warning header to the stale response, using Warning 110 (Response is stale)."
website "http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.46"

# More info #
# http://www.w3.org/Protocols/rfc2616/rfc2616-sec13.html
# http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :string=>@headers["warning"].to_s } unless @headers["warning"].nil?

	# Return passive matches
	m
end

end

