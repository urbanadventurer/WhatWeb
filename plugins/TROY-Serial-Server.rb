##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TROY-Serial-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-11
version "0.1"
description "TROY500 Serial Server allows connection for devices with RS232, RS422, RS485 serial ports."
website "http://www.troygroup.com/index.aspx"

# ShodanHQ results as at 2011-03-11 #
# 200 for XCD Web Admin



# Matches #
matches [

# Default Heading
{ :model=>"TROY500", :text=>'<BODY><CENTER><TABLE BORDER=0><TR ALIGN=CENTER><TD><FONT COLOR=RED SIZE=5>TROY Serial Server</FONT></TD></TR>' },

# Default Password Input
{ :model=>"TROY500", :text=>'Network Card Access Password&#058; </B><INPUT TYPE=PASSWORD SIZE=16 MAXLENGTH=16 NAME=access_psw>' },

]

# Passive #
def passive
	m=[]

	# HTTP Server & Date Header
	m << { :model=>"TROY500", :name=>"HTTP Server & Date Header" } if @headers["server"] =~ /^XCD Web Admin$/ and @headers["file-created"] =~ /^Wed, 14 Jul 1999 04:00:00 GMT$/

	# Return passive match
	m
end

end


