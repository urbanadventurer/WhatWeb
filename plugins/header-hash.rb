##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :probability
Plugin.define "Header-Hash" do
author "Andrew Horton"
version "0.1"
description "Analyze the header of the HTML. Turns the first 500 characters into a signature. This can be used to group websites created with something unexpected. It's successful if it returns the same hash for more than 10% of samples. Some types of sites have more variation than others."
# successfully finds: blogspot pages, vbulletin, microtik routers, ning sites, 
# also identifies stuff like various types of 404s, virtual directory listings not allowed, apache default

# expect some noise. 100 matched too much, 1000 matched too litte. 500 is ok

def passive		
	if @body.size > 4
		hash=Digest::MD5.hexdigest(@body[0..500])	
		[{:name=>"hash",:string=>hash}]
	else
		[]
	end
end

end

