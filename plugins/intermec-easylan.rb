##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Intermec-EasyLAN" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-10
version "0.1"
description "Intermec EasyLAN web interface"
website "http://www.intermec.com"

# ShodanHQ results as at 2011-03-10 #
# 200 for XCD WebAdmin



# Matches #
matches [

# Logo
{ :url=>"/imec.jpg", :md5=>"d0204544f2a9ec61184efb62d0b51515" },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^XCD WebAdmin$/ and @body =~ /Server Access Password: <\/B><INPUT TYPE="PASSWORD" SIZE="16" MAXLENGTH="16" NAME="ZZ_pwd">/ and @body =~ /<HTML><HEAD><TITLE>EasyLAN Web<\/TITLE><\/HEAD>/

		# Model Detection
		m << { :model=>@body.scan(/<TD><FONT COLOR="BLACK" SIZE="5">Intermec EasyLAN ([a-z\d]{3,4})<\/FONT><\/TD>/) } if @body =~ /<TD><FONT COLOR="BLACK" SIZE="5">Intermec EasyLAN ([a-z\d]{3,4})<\/FONT><\/TD>/

		# Model Detection # Pony
		m << { :model=>"Pony" } if @body =~ /<TD><FONT COLOR="BLACK" SIZE="5">XCD Pony<\/FONT><\/TD>/

	end

	# Return passive matches
	m
end

end


