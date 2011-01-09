##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Passport" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-09
version "0.1"
description "This plugin detects instances of Microsoft Live Passport servers using the MSNSERVER, X-MSNSERVER and PPServer HTTP headers."
# More info: http://code.entersources.com/f/Generate-Valid-MSNP9-ClientTicket_2_3254_0.aspx

# 1036 ShodanHQ results for MSNSERVER @ 2011-01-09
# 214 ShodanHQ results for PPServer @ 2011-01-09

# Examples #
examples %w|
64.4.34.74
64.4.61.53
64.4.61.141
65.52.114.184
65.52.116.132
65.54.205.13
65.54.251.254
65.54.248.248
65.54.248.249
65.54.186.18
65.54.216.183
65.55.40.71
65.55.64.186
65.55.72.215
65.55.85.119
65.55.255.15
207.46.150.159
207.46.150.163
207.46.150.166
207.46.150.172
|

# Passive #
def passive
	m=[]

	# PPServer HTTP Header # Retrieve local host name
	m << { :string=>@meta["ppserver"].to_s.scan(/H: ([\w\-\.]+) /) } if @meta["ppserver"] =~ /H: ([\w\-\.]+) /

	# MSNServer HTTP Header # Retrieve local host name
	m << { :string=>@meta["msnserver"].to_s.scan(/H: ([\w\-\.]+) /) } if @meta["msnserver"] =~ /H: ([\w\-\.]+) /

	# X-MSNServer HTTP Header # Retrieve local host name
	m << { :string=>@meta["x-msnserver"].to_s } unless @meta["x-msnserver"].nil?

	m
end

end

