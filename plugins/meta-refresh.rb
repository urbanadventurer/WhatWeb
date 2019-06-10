##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Meta-Refresh-Redirect"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-08-26
  # v0.2 # renamed from Meta-Refresh to Meta-Refresh-Redirect. Expanded description. 
  # v0.3 # 2011-01-31 # Updated regex. 
  # Andrew Horton # v0.3 # 2019-07-10 # Added .strip to URL
]
version "0.4"
description "Meta refresh tag is a deprecated URL element that can be
used to optionally wait x seconds before reloading the current page or loading a
new page. More info: https://secure.wikimedia.org/wikipedia/en/wiki/Meta_refresh"

# Google results as at 2011-01-31 #
# 2,510,000 for "you will be redirected in * seconds"

# Matches #
matches [
	# Extract URL from Meta Tag
]

passive do
	x = @body.scan(Target::meta_refresh_regex).flatten

	unless x.empty?
		meta_refresh = x.first
		meta_refresh = decode_html_entities(meta_refresh).strip
		[{:string=>meta_refresh}]
	else
		[]
	end
end

end

