##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "TalkSwitch-Phone" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-21
version "0.2"
description "TalkSwitch designs and builds telephone systems for small and multi-location businesses. The company's Private branch exchange (PBX) and hybrid IP-PBX products enable communication over telephone and Voice over IP (VoIP) networks."
website "http://www.talkswitch.com/"

# ShodanHQ results as at 2011-05-21 #
# 1,620 for TalkSwitch HTTP Server

# Google results as at 2011-05-21 #
# 3 for intitle:TalkSwitch "Welcome to TalkSwitch" "More information about TalkSwitch can be found on the TalkSwitch home page"

# Dorks #
dorks [
'intitle:TalkSwitch "Welcome to TalkSwitch" "More information about TalkSwitch can be found on the TalkSwitch home page"'
]

matches [
	
	# HTTP Server Header 
	{ :regexp=>/^TalkSwitch/, :search=>"headers[server]" },

	# HTTP Server Header # Version Detection
	{ :version=>/^TalkSwitch HTTP Server\/([\d\.]+)$/, :search=>"headers[server]" },

	# WWW-Authenticate Realm
	{ :regexp=>/^Digest realm="Your TalkSwitch System"$/, :search=>"headers[www-authenticate]", :name=>"WWW-Authenticate realm" },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^TalkSwitch HTTP Server\/([\d\.]+)$/

		# Model Detection
		m << { :model=>@body.scan(/<h3>Welcome to TalkSwitch ([^<]+) \([^\)]+\)<\/h3>/) } if @body =~ /<h3>Welcome to TalkSwitch ([^<]+) \([^\)]+\)<\/h3>/

		# Firmware Version Detection
		m << { :firmware=>@body.scan(/<p> Firmware version: ([\d\.]+)<\/p>/) } if @body =~ /<p> Firmware version: ([\d\.]+)<\/p>/

	end
	
	# Return passive matches
	m
end

end

