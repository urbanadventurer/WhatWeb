##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Cookies"
authors [
  "Andrew Horton",
  # v0.2 # removed :certainty=>100. 
  "Brendan Coles <bcoles@gmail.com>", # v0.3 # 2011-01-30 # Fixed regex bug Cookies were always split by "=" even when it wasn't present. 
  # Brendan Coles <bcoles@gmail.com>, # v0.4 # 2011-04-08 # Added username and localfile path detection for cookies containing public_html. 
  # Brendan Coles <bcoles@gmail.com>, # v0.5 # 2011-05-14 # Changed @cookies to @headers["set-cookie"] to support recursive mode. 
]
version "0.5"
description "Display the names of cookies in the HTTP headers. The values are not returned to save on space."

# ShodanHQ results as at 2011-04-08 #
# 2,527,334 for set-cookie
# 37 for set-cookie path home public_html
# 17 for set-cookie path=/home/ /public_html

# Passive #
passive do
	m=[]

	unless @headers["set-cookie"].nil? or @headers["set-cookie"].empty?

		# Extract cookie names
		@headers["set-cookie"].split("\n").each do |cookie|
			m << { :string=>cookie.split("=")[0] } if cookie =~ /=/
		end

		# Detect local file paths containing public_html
		if @headers["set-cookie"].to_s =~ /path=\/home[\d]*\/([^\/]+)\/public_html\//
			m << { :account=>@headers["set-cookie"].to_s.scan(/path=\/home[\d]*\/([^\/]+)\/public_html\//).flatten }
			m << { :filepath=>@headers["set-cookie"].to_s.scan(/path=(\/home[\d]*\/[^\/]+\/public_html\/)/).flatten }
		end

	end

	# Return passive match
	m
end

end

