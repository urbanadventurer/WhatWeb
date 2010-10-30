##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WebTrends" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-30
version "0.1"
description "This session tracking definition tracks visits using third-party cookies. WebTrends uses the WT.co_d query parameter for first-time hit tracking and the WEBTRENDS_ID cookie for session tracking. - More info: http://diveoreport.diveo.net.br/wrc/help/webhelp/hlp_ost.htm"

# About 4065 ShodanHQ results for "Set-Cookie: WEBTRENDS_ID="
examples %w|
198.180.240.221
162.128.70.33
193.201.74.113
208.118.238.50
38.119.237.108
69.198.36.115
207.173.156.188
66.208.62.143
63.111.163.79
|

# Passive # HTTP Header
def passive
	m=[]

	# Cookies
	m << { :string=>@meta["set-cookie"].scan(/WEBTRENDS_ID=([\d\.]+)-[\d\.]+;[^\r^\n]*expires=[^,]*, ([^\s]*) /) } if @meta["set-cookie"] =~ /WEBTRENDS_ID=([\d\.]+)-[\d\.]+;[^\r^\n]*expires=[^,]*, ([^\s]*) /

	m

end

end

