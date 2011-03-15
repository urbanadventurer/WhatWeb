##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Telligent-Community-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "Telligent Community (previously known as Community Server) is a community and collaboration software platform developed by Telligent Systems and was first released in 2004. Telligent Community is built on the Telligent Evolution platform, with a variety of core applications running on top of it such as blogs, forums, media galleries, and wikis. Telligent Community is built with ASP.NET, C#, and Microsoft SQL Server. The product used to be named Community Server before being rebranded as part of the 5.0 release. - Homepage: http://telligent.com/products/telligent_community/"

# ShodanHQ results as at 2011-03-15 #
# 658 for communityserver

# Examples #
examples %w|
66.129.71.27
146.217.8.128
208.40.147.100
74.86.47.16
199.79.186.117
66.240.69.219
213.225.135.130
82.165.129.142
92.52.93.58
208.71.18.59
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP CommunityServer Header
	m << { :version=>@meta["communityserver"].scan(/^([\d\.]+)$/) } if @meta["communityserver"] =~ /^([\d\.]+)$/

	# Set-Cookie Header
	if @meta["set-cookie"] =~ /^CommunityServer-UserCookie[\d\.]+/ or @meta["set-cookie"] =~ /^CommunityServer-LastVisitUpdated-[\d\.]+/

		m << { :name=>"Cookies" }

	end

	# Return passive matches
	m
end

end

