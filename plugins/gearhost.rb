##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-03-06 #
# Updated OS detection
##
# Version 0.2 # 2011-02-10 #
# Updated regex match
##
Plugin.define "GearHost" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-25
version "0.3"
description "GearHost is a Microsoft Gold Certified Windows Hosting Partner that specializes in complex hosted managed servers, CloudServers and shared Windows Web Hosting Solutions for ASP.NET, ColdFusion, Exchange Business Email and other technologies."
website "http://www.gearhost.com/"

# ShodanHQ results as at 2010-10-25 #
# 1,369 for Hosted-With: GearHost Inc. (www.gearhost.com)



# HTTP Header
def passive
	m=[]

	# Hosted-With HTTP Header
	m << { :os=>"Windows", :module=>"ASP.NET, ColdFusion, PHP, Perl" } if @headers["hosted-with"] =~ /[\s]*GearHost Inc\. \(www.gearhost.com\)/

	# Return Passive Matches
	m
end

end

