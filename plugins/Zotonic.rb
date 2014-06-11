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



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/Zotonic\/([^\s]+)/) } if @headers["server"] =~ /Zotonic\/([^\s]+)/

	# z_pid and z_sid cookies
	if @headers["set-cookie"] =~ /z_pid=[^;]+;/ and @headers["set-cookie"] =~ /z_sid=[^;]+;/
		m << { :name=>"z_pid and z_sid cookies" }
	end

	# Return passive matches
	m
end

end

