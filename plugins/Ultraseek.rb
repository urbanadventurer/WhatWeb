##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ultraseek" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-02
version "0.1"
description "Ultraseek - web site search engine product information - Homepage [Offline] : http://www.ultraseek.com/"

# ShodanHQ results as at 2011-06-02 #
# 350 for Ultraseek

# Examples #
examples %w|
202.228.58.253
12.96.58.100
209.156.246.164
195.41.97.244
200.245.207.182
193.178.2.246
205.181.72.201
70.42.48.195
217.145.112.82
207.192.33.70
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Ultraseek\/([^\s]+)$/) } if @headers["server"] =~ /^Ultraseek\/([^\s]+)$/

	# Return passive matches
	m
end

end

