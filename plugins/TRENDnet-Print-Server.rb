##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TRENDnet-Print-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-07
version "0.1"
description "TRENDnet Print Server - Print servers connect printers directly to the network so that multiple PCs can share them. - Homepage: http://www.trendnet.com/products/products.asp?cat=46"

# ShodanHQ results as at 2011-03-07 #
# 1,142 for PRINT_SERVER WEB
# 1,142 for PRINT_SERVER WEB 1.0



# Matches #
matches [

# Frameset
{ :text=>'<frame name="Banner" scrolling="no" noresize target="Inhalt" src="head.htm">' },

# Model Detection # /head.htm
{ :url=>"/head.htm", :model=>/<td width="415" align="right" background="bg.gif" valign="bottom"><b><font size="2" color="#FFFFFF">[^<]+ Print Server<br>([^<]{5,15})<\/font><\/b><\/td>/ },

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


