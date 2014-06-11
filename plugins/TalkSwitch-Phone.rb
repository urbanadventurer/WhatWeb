##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TalkSwitch-Phone" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-21
version "0.1"
description "TalkSwitch designs and builds telephone systems for small and multi-location businesses. The company's Private branch exchange (PBX) and hybrid IP-PBX products enable communication over telephone and Voice over IP (VoIP) networks. - Homepage: http://www.talkswitch.com/"

# ShodanHQ results as at 2011-05-21 #
# 1,620 for TalkSwitch HTTP Server

# Google results as at 2011-05-21 #
# 3 for intitle:TalkSwitch "Welcome to TalkSwitch" "More information about TalkSwitch can be found on the TalkSwitch home page"

# Dorks #
dorks [
'intitle:TalkSwitch "Welcome to TalkSwitch" "More information about TalkSwitch can be found on the TalkSwitch home page"'
]



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^TalkSwitch HTTP Server\/([\d\.]+)$/

		# Version Detection
		m << { :version=>@headers["server"].scan(/^TalkSwitch HTTP Server\/([\d\.]+)$/) }

		# Model Detection
		m << { :model=>@body.scan(/<h3>Welcome to TalkSwitch ([^<]+) \([^\)]+\)<\/h3>/) } if @body =~ /<h3>Welcome to TalkSwitch ([^<]+) \([^\)]+\)<\/h3>/

		# Firmware Version Detection
		m << { :firmware=>@body.scan(/<p> Firmware version: ([\d\.]+)<\/p>/) } if @body =~ /<p> Firmware version: ([\d\.]+)<\/p>/

	end

	# WWW-Authenticate Realm
	m << { :name=>"WWW-Authenticate realm" } if @headers["www-authenticate"] =~ /^Digest realm="Your TalkSwitch System"$/

	# Return passive matches
	m
end

end

