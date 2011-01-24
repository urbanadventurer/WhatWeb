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
examples %w|
194.185.104.85
212.20.102.132
155.199.148.174
184.73.28.176
217.149.125.198
155.199.149.67
155.199.36.227
64.40.180.24
194.185.104.85
150.254.14.91
209.207.83.19
212.20.102.132
155.199.148.174
209.207.75.227
|

# Passive #
def passive
	m=[]

	# Allow HTTP Header
	m << { :module=>@meta["allow"].to_s } unless @meta["allow"].nil?

	m

end

end

