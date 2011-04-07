##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpMumbleAdmin" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-08
version "0.1"
description "Php Mumble Admin is an administration panel control for murmur 1.2.0 and higher. It's communicate over ICE and It's designed for multiple servers. - Homepage: http://phpmumbleadmin.sourceforge.net/"

# ShodanHQ results as at 2011-04-08 #
# 101 for phpMumbleADMIN

# Examples #
examples %w|
89.221.164.170
89.221.164.104
89.221.164.239
89.221.164.141
89.221.164.173
89.221.164.214
89.221.164.226
89.221.164.182
89.221.164.156
89.221.164.114
|

# Passive #
def passive
	m=[]

	# Set-Cookie: phpMumbleADMIN_session
	m << { :name=>"phpMumbleADMIN_session Cookie" } if @meta["set-cookie"] =~ /^phpMumbleADMIN_session=/

	# Return passive matches
	m
end

end


