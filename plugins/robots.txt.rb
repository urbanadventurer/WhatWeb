##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "robots_txt"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-22
  # v0.2 # Added aggressive `/robots.txt` retrieval. 
  # v0.3 # 2011-03-23 # Removed aggressive section. 
]
version "0.3"
description "This plugin identifies robots.txt files and extracts both allowed and disallowed directories. - More Info: http://www.robotstxt.org/"

# Google results as at 2011-03-23 #
# 920 for inurl:robots.txt filetype:txt



# Passive #
passive do
	m=[]

	# Extract directories if current file is robots.txt
	if @base_uri.path == "/robots.txt" and @body =~ /^User-agent:/i

		# File Exists
		m << { :name=>"File Exists" }

		# Disallow
		if @body =~ /^Disallow:[\s]*(.+)$/i
			m << { :string=>@body.scan(/^Disallow:[\s]*(.+)/i) }
		end

		# Allow
		if @body =~ /^Allow:[\s]*(.+)$/i
			m << { :string=>@body.scan(/^Allow:[\s]*(.+)/i) }
		end

	end

	# Return passive matches
	m
end

end

