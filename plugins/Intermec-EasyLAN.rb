##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Intermec-EasyLAN" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-10
version "0.1"
description "Intermec EasyLAN web interface - homepage: http://www.intermec.com"

# ShodanHQ results as at 2011-03-10 #
# 200 for XCD WebAdmin

# Examples #
examples %w|
128.208.91.155
211.24.154.252
91.218.189.132
128.208.145.1
128.95.189.170
128.208.89.56
140.142.204.251
140.142.147.140
128.95.91.41
140.142.133.109
128.208.158.146
128.95.187.12
140.142.98.70
140.142.134.75
140.142.147.142
131.96.124.132
128.208.68.24
140.142.49.101
140.142.147.141
128.95.189.161
128.95.37.232
|

# Matches #
matches [

# Logo
{ :url=>"/imec.jpg", :md5=>"d0204544f2a9ec61184efb62d0b51515" },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^XCD WebAdmin$/ and @body =~ /Server Access Password: <\/B><INPUT TYPE="PASSWORD" SIZE="16" MAXLENGTH="16" NAME="ZZ_pwd">/ and @body =~ /<HTML><HEAD><TITLE>EasyLAN Web<\/TITLE><\/HEAD>/

		# Model Detection
		m << { :model=>@body.scan(/<TD><FONT COLOR="BLACK" SIZE="5">Intermec EasyLAN ([a-z\d]{3,4})<\/FONT><\/TD>/) } if @body =~ /<TD><FONT COLOR="BLACK" SIZE="5">Intermec EasyLAN ([a-z\d]{3,4})<\/FONT><\/TD>/

		# Model Detection # Pony
		m << { :model=>"Pony" } if @body =~ /<TD><FONT COLOR="BLACK" SIZE="5">XCD Pony<\/FONT><\/TD>/

	end

	# Return passive matches
	m
end

end


