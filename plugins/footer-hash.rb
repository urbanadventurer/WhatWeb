##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :probability

Plugin.define "Footer-Hash" do
author "Andrew Horton"
version "0.2"
description "Analyze the footer of the HTML. Turns the last 500 characters into a signature. Only activates for sites with more than 1000 characters on the page. This can be used to group websites created with something unexpected. It's successful if it returns the same hash for more than 10% of samples. Some types of sites have more variation than others."
# successfully finds: 
# 

# expect some noise. 100 matched too much, 1000 matched too litte. 500 is ok

# tail 500, only if page has 1000 or more. any less and the footer overlaps with the header

def passive
	if @body.size > 1000
		hash=Digest::MD5.hexdigest(@body[-500..-1])	
		[{:name=>"hash",:string=>hash}]
	else
		[]
	end
end

end

