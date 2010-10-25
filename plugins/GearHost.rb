##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "GearHost" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-25
version "0.1"
description "GearHost is a Microsoft Gold Certified Windows Hosting Partner that specializes in complex hosted managed servers, CloudServers and shared Windows Web Hosting Solutions for ASP.NET, ColdFusion, Exchange Business Email and other technologies. - Homepage: http://www.gearhost.com/"

# 1369 ShodanHQ results for Hosted-With: GearHost Inc. (www.gearhost.com)
examples %w|
69.24.78.59
69.24.78.66
69.24.78.69
69.24.78.79
69.24.71.151
69.24.71.219
69.24.70.136
69.24.74.147
69.24.68.234
69.24.78.188
69.24.79.92
69.24.64.101
69.24.64.102
69.24.64.103
69.24.64.104
69.24.68.105
|

# HTTP Header
def passive
	m=[]

	m << { :version=>"Windows", :modules=>"ASP.NET, ColdFusion, PHP, Perl" } if @meta["Hosted-With"] =~ /[\s]*GearHost Inc. \(www.gearhost.com\)/
	m << { :version=>"Windows", :modules=>"ASP.NET, ColdFusion, PHP, Perl" } if @meta["hosted-with"] =~ /[\s]*GearHost Inc. \(www.gearhost.com\)/

	m

end

end

