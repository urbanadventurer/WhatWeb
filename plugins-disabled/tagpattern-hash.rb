##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Tag-Hash"
authors [
  "Andrew Horton",
]
version "0.2"
description "Fuzzy pattern matching. Analyze the structure of HTML tags. Turns the opening and closing tag order into a signature. Threshold is set at at least 12 open or closing tags. This can be used to group websites created with something unexpected. The signature is hashed to save log file size. Unhashed signatures could be used to group by similarity."

# div & span has found nothing yet
# this produces nothing useful for just div or just span

# inspired by this work - http://www.aharef.info/static/htmlgraph/?url=https://www.morningstarsecurity.com/


# a method to keep the pattern, yet encode to reduce size would be..
# convert binary to decimal
# convert number to hex 


passive do	
	hash=Digest::MD5.hexdigest(@tagpattern)
	[{:name=>"tag pattern hash",:string=>hash}]
end

end

