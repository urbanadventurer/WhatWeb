##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PacketShaper" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-19
version "0.1"
description "The Blue Coat PacketShaper provides application performance monitoring for an accurate picture of network traffic and ensures business-critical applications have the resources they need to operate effectively"
website "http://www.bluecoat.com/products/packetshaper"
# Datasheet: http://www.bluecoat.com/doc/7941

# ShodanHQ results as at 2011-04-19 #
# 47 for PSlcV310

# Google results as at 2011-04-19 #
# 29 for (intitle:"PacketShaper Login")|(intitle:"PacketShaper Customer Login") -intitle

# Dorks #
dorks [
'(intitle:"PacketShaper Login")|(intitle:"PacketShaper Customer Login") -intitle'
]



# Matches #
matches [

# Default title
{ :text=>'<title>PacketShaper Customer Login</title>' },

# JavaScript
{ :text=>'<SCRIPT LANGUAGE=JavaScript SRC="/libmd5.js"></SCRIPT>' },

]

# Passive #
def passive
	m=[]

	# PScfgstr cookie
	if @headers['set-cookie'] =~ /^PScfgstr=/

		m << { :name=>"PScfgstr cookie" }

		# Model Detection
		m << { :model=>@body.scan(/desc \+= '<FONT SIZE=\+2><I>PacketShaper ([\d\.]+)<\/I><\/FONT>';/) } if @body =~ /desc \+= '<FONT SIZE=\+2><I>PacketShaper ([\d\.]+)<\/I><\/FONT>';/

	end

	# Return passive matches
	m
end

end


