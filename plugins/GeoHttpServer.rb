##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "GeoHttpServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.1"
description "GeoHttpServer - Homepage: http://www.geovision.com.tw/english/index.asp"

# ShodanHQ results as at 2011-05-30 #
# 106,570 for GeoHttpServer

# Examples #
examples %w|
184.11.63.186
155.229.217.241
200.10.100.26
90.176.144.193
206.59.17.155
82.99.146.1
190.144.83.134
213.91.167.68
|

# Matches #
matches [

# Aggressive # /Language.js
{ :url=>"/Language.js", :md5=>"f98b7425f7ff4680ac7682ed61844a17" },
{ :url=>"/Language.js", :md5=>"6682a8f95d0beb6524f0c08d2982654e" },
{ :url=>"/Language.js", :md5=>"97cdb361307be266683bceb8c452927b" },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^GeoHttpServer$/
		m << { :name=>"HTTP Server Header" }
	end

	# Return passive matches
	m
end

end

