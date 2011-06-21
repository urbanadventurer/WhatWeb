##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zotonic" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-21
version "0.1"
description "Zotonic, The Erlang CMS - Zotonic is an open source content management system for people that want a fast, extensible, flexible and complete system for dynamic web sites. It is built from the ground up with rich internet applications and web publishing in mind. - Homepage: http://zotonic.com/"

# ShodanHQ results as at 2011-06-21 #
# 15 for z_pid z_sid
# 13 for Zotonic

# Examples #
examples %w|
zotonic.com
178.79.139.85
62.109.14.46
78.47.231.20
184.106.217.46
109.74.203.217
188.40.113.133
80.69.73.11
78.24.222.113
85.17.170.50
85.17.151.179
205.186.148.92
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/Zotonic\/([^\s]+)/) } if @meta["server"] =~ /Zotonic\/([^\s]+)/

	# z_pid and z_sid cookies
	if @meta["set-cookie"] =~ /z_pid=[^;]+;/ and @meta["set-cookie"] =~ /z_sid=[^;]+;/
		m << { :name=>"z_pid and z_sid cookies" }
	end

	# Return passive matches
	m
end

end

