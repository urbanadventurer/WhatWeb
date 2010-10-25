##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "KaZaA" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-25
version "0.1"
description "This plugin retrieves the KaZaA ip, network and username from the HTTP headers."

# About 74 ShodanHQ results for X-Kazaa-Username
examples %w|
24.175.151.163
68.41.212.206
68.202.95.27
|

# HTTP Header
def passive
	m=[]

	# X-Kazaa-IP
	m << { :version=>@meta["x-kazaa-ip"].to_s.scan(/[\s]*([\d\.\:]+)/) } if @meta["x-kazaa-ip"].to_s =~ /[\s]*([\d\.\:]+)/
	m << { :version=>@meta["X-Kazaa-IP"].to_s.scan(/[\s]*([\d\.\:]+)/) } if @meta["X-Kazaa-IP"].to_s =~ /[\s]*([\d\.\:]+)/

	# X-Kazaa-Network
	m << { :modules=>@meta["x-kazaa-network"].to_s.scan(/[\s]*([^\r^\n]+)/) } if @meta["x-kazaa-network"].to_s =~ /[\s]*([^\r^\n]+)/
	m << { :version=>@meta["X-Kazaa-Network"].to_s.scan(/[\s]*([^\r^\n]+)/) } if @meta["X-Kazaa-Network"].to_s =~ /[\s]*([^\r^\n]+)/

	# X-Kazaa-Username
	m << { :accounts=>@meta["x-kazaa-username"].to_s.scan(/[\s]*([^\r^\n]+)/) } if @meta["x-kazaa-username"].to_s =~ /[\s]*([^\r^\n]+)/
	m << { :accounts=>@meta["X-Kazaa-Username"].to_s.scan(/[\s]*([^\r^\n]+)/) } if @meta["X-Kazaa-Username"].to_s =~ /[\s]*([^\r^\n]+)/

	m

end

end

