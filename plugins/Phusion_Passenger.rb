##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Phusion_Passenger" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-10
version "0.1"
description 'Phusion Passenger - a.k.a. mod_rails or mod_rack - makes deployment of Ruby web applications, such as those built on the revolutionary Ruby on Rails web framework, a breeze. It follows the usual Ruby on Rails conventions, such as "Dont-Repeat-Yourself" - Homepage: http://www.modrails.com/'

# ShodanHQ results as at 2011-03-10 #
# 83,668 for Phusion_Passenger

# Examples #
examples %w|
163.221.193.121
174.121.44.173
109.164.245.221
184.73.236.167
217.10.138.175
67.23.3.162
208.79.232.252
174.133.0.51
50.22.30.199
174.132.4.222
125.172.139.205
75.125.136.102
174.120.169.37
74.54.175.138
46.17.2.102
222.230.54.123
86.186.87.70
74.53.62.103
94.102.152.146
|

# Passive #
def passive
	m=[]

	# Server
	m << { :version=>@meta["server"].scan(/[\s]+Phusion_Passenger\/([\d\.]+)/) } if @meta["server"] =~ /[\s]+Phusion_Passenger\/([\d\.]+)/

	# X-Powered-By: Phusion Passenger (mod_rails/mod_rack)
	m << { :version=>@meta["x-powered-by"].scan(/Phusion Passenger \(mod_rails\/mod_rack\) ([\d\.]+)/) } if @meta["x-powered-by"] =~ /Phusion Passenger \(mod_rails\/mod_rack\) ([\d\.]+)/

	# Return passive matches
	m
end

end


