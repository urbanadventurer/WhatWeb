##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "POST-Parameters" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-10
version "0.1"
description "This plugin extracts the form post URL as well as all 'id' and 'name' parameters from <input>, <select> and <textarea> elements inside <form> elements which use the POST method. It cannot detect POST parameters used by asynchronous javascript. - More Info: http://en.wikipedia.org/wiki/POST_%28HTTP%29"



# Matches #
matches [

# URL Detection
{ :string=>/<form[^>]+action[\s]*=[\s]*["']([^'^"]+)[^>]+method[\s]*=[\s]*["']post["'][^>]*>/ },
{ :string=>/<form[^>]+method[\s]*=[\s]*["']post["'][^>]+action[\s]*=[\s]*["']([^'^"]+)[^>]*>/ },

]

# Passive #
def passive
	m=[]

	# Form Detection
	if @body =~ /<form[^>]+method[\s]*=[\s]*["']post["'][^>]*>.+<\/form>/im

		@body.scan(/<form[^>]+method[\s]*=[\s]*["']post["'][^>]*>(.+)<\/form>/im).to_s.scan(/<(input|select|textarea)[^>]+(name|id)[\s]*=[\s]*["']([^'^"]+)[^>]*>/i).each do |p|
			m << { :module=>p[2] }
		end

	end

	# Return passive matches
	m
end

end

