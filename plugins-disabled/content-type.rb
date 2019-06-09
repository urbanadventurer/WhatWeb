##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Content-Type"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-01-24
]
version "0.1"
description "This plugin identifies the document's content type."

# More info: http://en.wikipedia.org/wiki/List_of_HTTP_header_fields



# Passive #
passive do
	m=[]

	# Extract conent type
	m << { :string=>@headers["content-type"].to_s } unless @headers["content-type"].nil?

	# Return passive matches
	m

end

end


