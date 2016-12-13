##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Allow" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-01
version "0.1"
description "This plugin retrieves the allowed methods from the HTTP Allow header. - More info: http://en.wikipedia.org/wiki/List_of_HTTP_header_fields"

# 83 ShodanHQ results for "Allow: PUT" @ 2010-11-01
# About 255 ShodanHQ results for "Allow: DELETE" @ 2010-11-01


# Passive #
def passive
	m=[]

	# Allow HTTP Header
	m << { :module=>@headers["allow"].to_s } unless @headers["allow"].nil?

	m

end

end

