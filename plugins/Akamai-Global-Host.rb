##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-07 #
# Updated HTTP Server Header match
##
Plugin.define "Akamai-Global-Host" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.2"
description "Akamai-Global-Host HTTPd"

# About 624447 ShodanHQ results for "server: AkamaiGHost" @ 2010-10-26

# Examples #
examples %w|
24.200.239.8
184.87.51.66
95.100.27.229
88.221.133.187
125.56.251.206
96.6.66.83
96.7.46.77
59.151.154.93
184.50.127.176
173.223.26.104
|

# Passive #
def passive
	m=[]

	# HTTP Server Header #
	m << { :name=>"HTTP Server Header" } if @meta["server"].to_s =~ /^[\s]*AkamaiGHost/

	m
end

end

