##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "iHTML" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-04
version "0.1"
description "iHTML is a server side internet/web programming and scripting language in used by thousands of sites worldwide to deliver cost effective dynamic database driven web sites. - Homepage: http://www.ihtml.com/"

# ShodanHQ results as at 2011-06-04 #
# 593 for iHTML

# Examples #
examples %w|
217.25.65.44
205.210.230.181
195.10.246.83
205.210.228.158
205.210.230.170
205.210.230.118
205.210.228.33
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/ \(Using iHTML\/([^\)^\s]+)\)/) } if @meta["server"] =~ / \(Using iHTML\/([^\)^\s]+)\)/

	# Version Detection # X-Powered-By Header
	m << { :version=>@meta["x-powered-by"].scan(/^iHTML\/([^\s]+)$/) } if @meta["x-powered-by"] =~ /^iHTML\/([^\s]+)$/

	# Return passive matches
	m
end

end

