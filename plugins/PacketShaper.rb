##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PacketShaper" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-19
version "0.1"
description "The Blue Coat PacketShaper provides application performance monitoring for an accurate picture of network traffic and ensures business-critical applications have the resources they need to operate effectively - Homepage: http://www.bluecoat.com/products/packetshaper"
# Datasheet: http://www.bluecoat.com/doc/7941

# ShodanHQ results as at 2011-04-19 #
# 47 for PSlcV310

# Google results as at 2011-04-19 #
# 29 for (intitle:"PacketShaper Login")|(intitle:"PacketShaper Customer Login") -intitle

# Dorks #
dorks [
'(intitle:"PacketShaper Login")|(intitle:"PacketShaper Customer Login") -intitle'
]

# Examples #
examples %w|
198.161.121.11
143.226.32.149
itekbs.com
202.152.0.167
packeteer.afsat.com
216.114.194.195
206.23.60.5
125.22.90.131
202.28.119.2
74.40.36.166
70.61.244.66
66.244.117.41
203.211.136.60
files.frashii.com
angelpilot.milligan.edu
65.202.203.140
https://134.39.200.107
packeteer-cen.wesleyan.edu
packeteer.arc.net.my
pc002.sis.com.hk
packeteer.wmisd.org
125.22.35.163
95.130.103.4
203.160.246.28
202.228.6.197
81.80.87.252
|

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
	if @meta['set-cookie'] =~ /^PScfgstr=/

		m << { :name=>"PScfgstr cookie" }

		# Model Detection
		m << { :model=>@body.scan(/desc \+= '<FONT SIZE=\+2><I>PacketShaper ([\d\.]+)<\/I><\/FONT>';/) } if @body =~ /desc \+= '<FONT SIZE=\+2><I>PacketShaper ([\d\.]+)<\/I><\/FONT>';/

	end

	# Return passive matches
	m
end

end


