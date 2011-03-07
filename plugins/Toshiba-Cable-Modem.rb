##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Toshiba-Cable-Modem" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-07
version "0.1"
description "Toshiba Cable Modem - Homepage: http://www.toshiba.com/"

# ShodanHQ results as at 2011-03-07 #
# 5,583 for Document follows PCX3000
# 5,583 for Document follows PCX
# All results are from Japan

# Examples #
examples %w|
203.215.225.134/up.html
203.133.197.7/up.html
203.133.222.133/up.html
61.122.63.86/up.html
111.67.191.248/up.html
219.113.83.191/up.html
122.152.45.17/up.html
61.122.62.10/up.html
61.122.61.158/up.html
61.122.63.161/up.html
|

# Matches #
matches [

# Default Title
{ :text=>"<TITLE>Toshiba Cable Modem PCX3000</TITLE>", :certainty=>75 },

# Default logo
{ :url=>"/pcx3k.gif", :md5=>"b70118d64dc5a404f82467bbf3858524", :model=>"PCX3000" },

# Page Heading # /up.html
{ :url=>"/up.html", :text=>"<BR><FONT color=navy size=5>Toshiba Cable Modem Diagnostics Page &nbsp;</FONT>" },

# CMTS MAC Detection # /up.html
{ :url=>"/up.html", :string=>/<STRONG>CMTS MAC Address:<FONT color="#980040">([^<]+)<\/FONT><\/STRONG>/ },

# Model Detection # /up.html
{ :url=>"/up.html", :model=>/<STRONG>&nbsp;&nbsp;MODEL[\r\n]*<FONT COLOR="#980040">([^\s^<]+)<\/FONT>/ },

# Firmware Version Detection # /up.html
{ :url=>"/up.html", :firmware=>/;&nbsp;HW_REV[\r\n]*<FONT COLOR="#980040">([^\s^<]+)<\/FONT>/ },

# Software Version Detection # /up.html
{ :url=>"/up.html", :version=>/;&nbsp;SW_REV[\r\n]*<FONT COLOR="#980040">([^\s^<]+)<\/FONT>/ },

]

# Passive #
def passive
	m=[]

	# Server: PCX3000/1.0
	m << { :model=>"PCX3000" } if @meta["server"] =~ /^PCX3000\/[\d\.]{1,5}/

	# Return passive matches
	m
end

end


