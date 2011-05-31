##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Xitami" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "Xitami - Fast, small, secure, portable web server. The Xitami product line stretches back to 1996. X5 is built using iMatix's current Base2 technology for multithreading applications. - Homepage: http://www.xitami.com/"

# ShodanHQ results as at 2011-05-31 #
# 1,777 for Xitami

# Examples #
examples %w|
186.125.221.246
89.84.127.18
209.161.7.164
130.149.130.180
168.226.217.248
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @meta["server"] =~ /^Xitami$/

	# Edition Detection # HTTP Server Header
	m << { :string=>@meta["server"].scan(/^Xitami\/([^\s]+)$/) } if @meta["server"] =~ /^Xitami\/([^\s]+)$/

	# Return passive matches
	m
end

end

