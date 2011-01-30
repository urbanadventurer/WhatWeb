##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-01-30 # Brendan Coles <bcoles@gmail.com>
# Fixed regex bug # Cookies were always split by "=" even when it wasn't present
##
# Version 0.2
# removed :certainty=>100
##
Plugin.define "Cookies" do
author "Andrew Horton"
version "0.3"
description "Display the names of cookies in the HTTP headers. The values are not returned to save on space."

# Passive #
def passive
	m=[]

	# Extract cookie names #
	unless @cookies.nil? or @cookies.empty?
		@cookies.each do |cookie|
			m << { :string=>cookie.split("=")[0] } if cookie =~ /=/
		end
	end

	# Return passive match
	m
end

end


