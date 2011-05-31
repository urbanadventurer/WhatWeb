##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Commerce-Builder" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-01
version "0.1"
description "Internet Factory's Commerce Builder web server [Discontinued] - Homepage: http://www.ifact.com/"

# ShodanHQ results as at 2011-06-01 #
# 32 for commerce-builder

# Examples #
examples %w|
196.211.223.26
67.227.18.164
67.227.18.161
209.157.66.179
209.157.66.180
209.157.66.186
209.157.66.162
67.227.18.165
64.40.123.71
209.157.66.182
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^Commerce-Builder\/([^\s]+)/) } if @meta["server"] =~ /^Commerce-Builder\/([^\s]+)/

	# Return passive matches
	m
end

end

