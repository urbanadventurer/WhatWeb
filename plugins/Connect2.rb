##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Connect2" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "Message Handling System (MHS) is an important early email protocol developed by Novell. A compatible family of products from Infinite Technologies ( now Captaris - http://www.captaris.com ) and marketed under the name Connect2 were also very widely used as part of MHS-based email networks. - More info: http://en.wikipedia.org/wiki/Message_Handling_System"

# ShodanHQ results as at 2011-05-31 #
# 25 for Web Services Module

# Examples #
examples %w|
64.7.164.161
64.7.164.168
64.7.164.157
64.7.164.169
64.7.164.166
64.7.164.152
64.7.164.171
64.7.164.167
64.7.164.158
|

# Passive #
def passive
	m=[]

	# Web Services Module # Version Detection # HTTP Server Header
	m << { :module=>@headers["server"].scan(/^(Web Services Module [^\s]+ \([\d]+\)) for Connect2-SMTP$/) } if @headers["server"] =~ /^(Web Services Module [^\s]+ \([\d]+\)) for Connect2-SMTP$/

	# Return passive matches
	m
end

end

