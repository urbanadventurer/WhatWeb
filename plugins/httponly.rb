##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "HttpOnly"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-06-03
]
version "0.1"
description "If the HttpOnly flag is included in the HTTP set-cookie response header and the browser supports it then the cookie cannot be accessed through client side script - More Info: http://en.wikipedia.org/wiki/HTTP_cookie"

# More Info #
# http://msdn.microsoft.com/workshop/author/dhtml/httponly_cookies.asp
# http://www.gnucitizen.org/blog/why-httponly-wont-protect-you/
# https://www.owasp.org/index.php/HttpOnly

# ShodanHQ results as at 2011-06-03 #
# 252,825 for httponly



# Passive #
passive do
	m=[]

	# Set-Cookie Header
	unless @headers["set-cookie"].nil? or @headers["set-cookie"].empty?

=begin
		@headers["set-cookie"].each do |cookie|

			if cookie =~ /;[\s]*httponly/i
				m << { :string=>cookie.scan(/^([^;^=]+).*;[\s]*httponly/i) } if cookie =~ /^([^;^=]+).*;[\s]*httponly/i
			end

		end
=end
		if @headers["set-cookie"] =~ /;[\s]*httponly/i
			m << { :string=>@headers["set-cookie"].scan(/^([^;^=]+).*;[\s]*httponly/i) } if @headers["set-cookie"] =~ /^([^;^=]+).*;[\s]*httponly/i
		end
	end

	# Return passive matches
	m
end

end

