##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Niagara-Web-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-01
version "0.1"
description "Niagara Web Server"

# 8073 ShodanHQ results for "Niagara web server"
examples %w|
204.38.42.28
129.240.197.206
199.79.254.204
24.240.168.154
166.66.68.109
12.50.82.185
173.14.85.126
165.138.178.71
65.103.138.230
173.162.64.97
68.185.48.215
74.175.101.244
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :version=>@meta["server"].scan(/Niagara Web Server\/([\d\.]+)/).to_s } if @meta["server"] =~ /Niagara Web Server\/([\d\.]+)/

	# HTTP Niagara-Release Header
	m << { :version=>@meta["niagara-release"].to_s } unless @meta["niagara-release"].nil?

	# HTTP Niagara-ffs Header
	m << { :name=>"Niagara-ffs HTTP Header" } unless @meta["niagara-ffs"].nil?

	m

end

end

