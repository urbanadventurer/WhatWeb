##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SpeedTouch" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.1"
description "SpeedTouch is the brand name of a line of networking equipment produced by Alcatel and Technicolor SA. Before 27 January 2010 Technicolor was known as Thomson SA. Under the SpeedTouch name Alcatel and Technicolor retail a variety of equipment including ADSL and ADSL2+ modems, residential gateways, wireless access equipment, VoIP handsets and SHDSL interconnect equipment. They are a major brand in home and business networking products. - More Info: http://en.wikipedia.org/wiki/SpeedTouch"
# Homepage: http://www.thomsontelecom.com.au/speedtouch/support.htm

# ShodanHQ results as at 2011-05-30 #
# 435,213 for SpeedTouch -SIP http



# Matches #
matches [

# Default Favicon
{ :url=>"/favicon.ico", :md5=>"befcded36aec1e59ea624582fcb3225c" },

]

# Passive #
def passive
	m=[]

	# WWW-Authenticate # realm SpeedTouch
	if @headers["www-authenticate"] =~ /(Basic|Digest) realm="SpeedTouch/

		m << { :name=>"WWW-Authenticate realm" }

		# WWW-Authenticate # realm SpeedTouch # MAC Address Detection
		m << { :string=>@headers["www-authenticate"].scan(/Basic realm="SpeedTouch \(([\dA-F]{2}\-[\dA-F]{2}\-[\dA-F]{2}\-[\dA-F]{2}\-[\dA-F]{2}\-[\dA-F]{2})\)/) } if @headers["www-authenticate"] =~ /Basic realm="SpeedTouch \(([\dA-F]{2}\-[\dA-F]{2}\-[\dA-F]{2}\-[\dA-F]{2}\-[\dA-F]{2}\-[\dA-F]{2})\)/

	end

	# Return passive matches
	m
end

end

