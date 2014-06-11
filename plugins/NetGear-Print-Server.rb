##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NetGear-Print-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-07
version "0.1"
description "NetGear Print Server - Print servers connect printers directly to the network so that multiple PCs can share them. - Homepage: http://www.netgear.com.au/au/Products/Print-Servers"

# ShodanHQ results as at 2011-03-07 #
# 1,142 for PRINT_SERVER WEB
# 1,142 for PRINT_SERVER WEB 1.0



# Matches #
matches [

# Title
{ :text=>'<title>NetGear Print Server Setup</title>' },

# NoScript Message
{ :text=>'<p>To provide an enhanced user interface, this Print Server uses JavaScript extensively.' },

# Title # /start.htm
{ :url=>"/start.htm", :text=>"<title>NETGEAR Print Server </title>" },

# Logo # /settings.gif
{ :url=>"/settings.gif", :md5=>"d6b979c739a809658a0e8833bc64b900" },

]

# Passive #
def passive
	m=[]

	# Server: PRINT_SERVER WEB # Also used by other printer servers
	m << { :certainty=>25, :version=>@headers["server"].scan(/^PRINT_SERVER WEB ([\d\.]+)$/) } if @headers["server"] =~ /^PRINT_SERVER WEB ([\d\.]+)$/

	# Return passive matches
	m
end

end


