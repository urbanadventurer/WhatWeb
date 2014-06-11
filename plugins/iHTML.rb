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



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/ \(Using iHTML\/([^\)^\s]+)\)/) } if @headers["server"] =~ / \(Using iHTML\/([^\)^\s]+)\)/

	# Version Detection # X-Powered-By Header
	m << { :version=>@headers["x-powered-by"].scan(/^iHTML\/([^\s]+)$/) } if @headers["x-powered-by"] =~ /^iHTML\/([^\s]+)$/

	# Return passive matches
	m
end

end

