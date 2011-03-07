##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OpenWrt" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-07
version "0.1"
description "A GNU/Linux based firmware program for embedded devices such as residential gateways and routers. - Homepage: http://openwrt.org/"

# ShodanHQ results as at 2011-03-07 #
# 417 for OpenWRT realm
# 69 for OpenWRT -realm

# Examples #
examples %w|
92.127.96.132
92.125.225.83
92.127.211.137
86.54.177.131
78.111.114.10
92.125.139.188
201.219.199.203
|

# Matches #
matches [

# Default Title
{ :text=>'<title>OpenWrt Administrative Console</title>' },

# Redirect Page
{ :text=>'OpenWrt Administrative Console<br />Redirecting to : <a style="color: inherit;" href="/cgi-bin/webif.sh">main page</a></p>' },

]

# Passive #
def passive
	m=[]

	# WWW-Authenticate: Basic realm="OpenWrt"
	m << { :name=>"realm OpenWrt" } if @meta["www-authenticate"] =~ / realm="OpenWrt"/

	# Return passive matches
	m
end

end


