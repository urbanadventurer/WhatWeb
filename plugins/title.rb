##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Title"
authors [
  "Andrew Horton",
  # v0.2 # removed :certainty=>100
  # v0.3 # 2014-08-22 # Remove newlines in title, give warning when newlines are found.
]
version "0.3"
description "The HTML page title"

passive do
	m=[]
 	if @body =~ /<title>[^<]+<\/title>/i
		title=@body.scan(/<title>([^<]+)<\/title>/i)[0][0]

		# Give warining if title element contains newline(s)
		if title.include? "\n"
			m << {:name=>"WARNING",:module=>"Title element contains newline(s)!"}
		end

		# Strip all newlines in title string (for better output)
		m << {:name=>"page title",:string=>title.strip}
	end
	m
end

end

