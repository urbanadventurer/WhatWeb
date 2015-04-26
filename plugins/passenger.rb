##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Passenger" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-10
version "0.1"
description 'Phusion Passenger - a.k.a. mod_rails or mod_rack - makes deployment of Ruby web applications, such as those built on the revolutionary Ruby on Rails web framework, a breeze. It follows the usual Ruby on Rails conventions, such as "Dont-Repeat-Yourself" - Homepage: http://www.modrails.com/'

# ShodanHQ results as at 2011-03-10 #
# 83,668 for Phusion_Passenger



# Passive #
def passive
	m=[]

	# Server
	m << { :version=>@headers["server"].scan(/[\s]+Phusion_Passenger\/([\d\.]+)/) } if @headers["server"] =~ /[\s]+Phusion_Passenger\/([\d\.]+)/

	# X-Powered-By: Phusion Passenger (mod_rails/mod_rack)
	m << { :version=>@headers["x-powered-by"].scan(/Phusion Passenger \(mod_rails\/mod_rack\) ([\d\.]+)/) } if @headers["x-powered-by"] =~ /Phusion Passenger \(mod_rails\/mod_rack\) ([\d\.]+)/

	# Return passive matches
	m
end

end


