##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ben-SSL" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-08
version "0.1"
description "Apache-SSL was developed by Ben Laurie and is often referred to as Ben-SSL - Homepage: http://apache-ssl.org/"

# ShodanHQ results as at 2011-02-08 #
# 34777 for Ben-SSL

# Examples #
examples %w|
128.121.217.70
60.43.130.107
198.66.208.223
198.65.50.32
60.43.131.52
87.106.255.9
212.227.100.152
209.82.81.3
87.106.177.131
129.97.56.41
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :version=>@meta["server"].to_s.scan(/Ben-SSL\/([\d\.]+)/i).to_s } if @meta["server"].to_s =~ /Ben-SSL\/([\d\.]+)/i

	m

end

end

