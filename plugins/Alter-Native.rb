##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Alter-Native" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-12-28
version "0.1"
description "Alter-Native - IBM UniVerse database and Client/Server solutions provider. SPID Product provider, creating dynamic Web servers using database links on Unix systems. - Homepage [Offline] : http://www.alternative.fr/"

# 20 for SPID HTTP Server -apache -IIS -nginx
# All results are from France

# Examples #
examples %w|
84.96.29.66
84.96.29.92
84.96.29.72
80.11.83.69
84.96.29.83
84.96.29.180
84.96.29.162
84.96.29.163
84.96.29.130
84.96.29.166
84.96.29.164
84.96.29.134
84.96.29.168
84.96.29.165
81.93.8.73
81.93.4.208
90.80.59.237
|

# Passive #
def passive
	m=[]

	# HTTP Server Header # Server: SPID HTTP Server - Alter Native
	m << { :string=>@meta["server"].scan(/^SPID HTTP Server - Alter Native \(([^\)]+)\)/) } if @meta["server"] =~ /^SPID HTTP Server - Alter Native \(([^\)]+)\)/

	# Return passive matches
	m
end

end


