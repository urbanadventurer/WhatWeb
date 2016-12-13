##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "X-XSS-Protection" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-08
version "0.1"
description "This plugin retrieves the X-XSS-Protection value from the HTTP header. - More Info: http://msdn.microsoft.com/en-us/library/cc288472%28VS.85%29.aspx"

# 6688 ShodanHQ results for X-XSS-Protection -mode @ 2011-01-08
# 9633 ShodanHQ results for X-XSS-Protection mode @ 2011-01-08
# 9633 ShodanHQ results for X-XSS-Protection mode=block @ 2011-01-08



# Passive #
def passive
	m=[]

	# X-XSS-Protection HTTP Header
	m << { :string=>@headers["x-xss-protection"].to_s } unless @headers["x-xss-protection"].nil?

	m

end

end

