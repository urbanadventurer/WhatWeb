##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-05-24 #
# Added WEBrick detection
##
Plugin.define "Ruby" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.2"
description "Ruby is a dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write. - homepage: http://www.ruby-lang.org/"

# ShodanHQ results as at 2011-05-24 #
# 22,172 for server: ruby
#    822 for WEBrick

# Examples #
examples %w|
219.118.99.129
12.49.88.2
68.142.82.239
89.46.128.51
75.101.162.117
93.159.43.99
213.132.96.34
134.106.62.56
212.75.96.249
24.233.112.57
50.17.236.165
|

# Passive #
def passive
	m=[]

	# Server # Version Detection
	m << { :version=>@meta["server"].to_s.scan(/Ruby\/([^\s^\/^\(]+)/).to_s } if @meta["server"].to_s =~ /Ruby\/([^\s^\/^\(]+)/

	if @meta["server"] =~ /^WEBrick\/[\d\.]+ \(Ruby\/[\d\.]+\/[\d]{4}-[\d]{2}-[\d]{2}\)/

		# WEBrick Version Detection
		m << { :module=>@meta["server"].scan(/^(WEBrick\/[\d\.]+) \(Ruby\/[\d\.]+\/[\d]{4}-[\d]{2}-[\d]{2}\)/) }

		# Version Detection
		m << { :version=>@meta["server"].scan(/^WEBrick\/[\d\.]+ \(Ruby\/([\d\.]+)\/[\d]{4}-[\d]{2}-[\d]{2}\)/) }

	end

	# Return passive matches
	m
end

end

